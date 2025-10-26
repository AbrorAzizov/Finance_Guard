
import 'package:finance_guard/features/categories/data/entity/category_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../servise_locator.dart';
import '../../../categories/domain/repo/categories_repo.dart';
import '../../../welcome & balance cubit/repo/balance_repo.dart';
import '../../domain/entity/initial_transaction.dart';
import '../../domain/entity/statistics.dart';
import '../../domain/entity/transaction_entity.dart';
import '../../domain/repository/transaction_repo.dart';
import 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository _transactionRepository =
      sl<TransactionRepository>();

  final  _categoryRepository = sl<CategoriesRepo>();

  final balance = sl<BalanceRepo>();

  TransactionCubit() : super(TransactionStateInitial());

  Future<void> loadAllTransactions() async {
    emit(TransactionStateLoading());
    try {
      final transactions = await _transactionRepository.getAllTransaction();
      final categories = await _categoryRepository.getAllCategories();

      emit(TransactionStateLoaded(transactions: transactions,categories: categories));
      await getAllData();
    } catch (e) {
      emit(TransactionStateError('Ошибка при загрузке транзакций: $e'));
    }
  }

  Future<void> createTransaction(InitialTransactionEntity transaction,CategoryEntity category) async {
    emit(TransactionStateLoading());
    try {
      await _transactionRepository.addTransaction(transaction);
      await _categoryRepository.addCategory(category);
      final totalBalance = balance.getTotal();
      final newTotal = transaction.type == 'income'
          ? totalBalance + transaction.amount
          : totalBalance - transaction.amount;
      balance.saveTotal(newTotal);
      emit(TransactionStateCreated());
    } catch (e) {
      emit(TransactionStateError('Ошибка при создании транзакции: $e'));
    }
  }

  Future<Statistics> loadSortByType({
    required List<TransactionEntity> transactions,
    required String period,
  }) async {
    emit(TransactionStateLoading());

    final transactionsByDate =
    _transactionRepository.filterTransactionsByDate(transactions, period);

    final expenses = _transactionRepository
        .filterTransactionsByType(transactionsByDate, 'expense');

    final totalExpenses = expenses.fold(0.0, (sum, e) => sum + e.amount);

    final incomes = _transactionRepository
        .filterTransactionsByType(transactionsByDate, 'income');

    final income = incomes
        .fold(0.0, (sum, e) => sum + e.amount);

    final previousTransactions =
    _transactionRepository.filterTransactionsByPreviousDate(
        transactions, period);

    final previousExpenses = _transactionRepository
        .filterTransactionsByType(previousTransactions, 'expense')
        .fold(0.0, (sum, e) => sum + e.amount);

    final previousIncome = _transactionRepository
        .filterTransactionsByType(previousTransactions, 'income')
        .fold(0.0, (sum, e) => sum + e.amount);


    double expensesChange = 0.0;
    if (previousExpenses > 0) {
      expensesChange = ((totalExpenses - previousExpenses) / previousExpenses) * 100;
    }

    double incomeChange = 0.0;
    if (previousIncome > 0) {
      incomeChange = ((income - previousIncome) / previousIncome) * 100;
    }



    return Statistics(
      incomes: incomes,
      totalIncome: income,
      totalExpenses: totalExpenses,
      expensesPercentageChange: expensesChange,
      incomePercentageChange: incomeChange,
      expenses: expenses
    );
  }

  Future<void> getAllData() async {
    final initialTransactions = await _transactionRepository.getAllTransaction();
    final categories = await _categoryRepository.getAllCategories();

    // ⚡ фильтруем только isTracked == true
    final trackedCategories = categories.where((c) => c.isTracked).toList();

    // создаём map: categoryId -> CategoryEntity
    final categoryMap = {for (var c in trackedCategories) c.id: c};

    // преобразуем транзакции, учитывая только отслеживаемые категории
    final transactions = initialTransactions.map((t) {
      final category = categoryMap[t.categoryId];

      return TransactionEntity(
        id: t.id,
        amount: t.amount,
        iconCodePoint: category?.iconCodePoint ?? 0,
        iconFontFamily: category?.iconFontFamily,
        categoryColor: category?.color ?? 0,
        date: t.date,
        comment: t.comment,
        type: t.type,
        name: category?.name ?? 'Unknown',
      );
    }).where((tx) => tx.name != 'Unknown').toList(); // ⚡ исключаем транзакции без категории

    final dayData = await loadSortByType(transactions: transactions, period: 'day');
    final weekData = await loadSortByType(transactions: transactions, period: 'week');
    final monthData = await loadSortByType(transactions: transactions, period: 'month');

    emit(TransactionStateSummary(
      dayData: dayData,
      weekData: weekData,
      monthData: monthData,
      transactions: transactions,
    ));
  }



}

