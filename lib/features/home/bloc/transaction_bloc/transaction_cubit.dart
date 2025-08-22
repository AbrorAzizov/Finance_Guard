import 'package:bloc/bloc.dart';

import '../../../../servise_locator.dart';
import '../../../welcome & balance cubit/repo/balance_repo.dart';
import '../../domain/entity/statistics.dart';
import '../../domain/entity/transaction_entity.dart';
import '../../domain/repository/transaction_repo.dart';
import 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository _transactionRepository =
      sl<TransactionRepository>();
  final balance = sl<BalanceRepo>();

  TransactionCubit() : super(TransactionStateInitial());

  Future<void> loadAllTransactions() async {
    emit(TransactionStateLoading());
    try {
      final transactions = await _transactionRepository.getAllTransaction();
      emit(TransactionStateLoaded(transactions: transactions));
      await getAllData();
    } catch (e) {
      emit(TransactionStateError('Ошибка при загрузке транзакций: $e'));
    }
  }

  Future<void> createTransaction(TransactionEntity transaction) async {
    emit(TransactionStateLoading());
    try {
      await _transactionRepository.addTransaction(transaction);
      final totalBalance = balance.getTotal();
      final newTotal = transaction.type == 'income'
          ? totalBalance + transaction.amount
          : totalBalance - transaction.amount;
      balance.saveTotal(newTotal);
      print(transaction.date.toString());
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
        .filterTransactionsByType(transactionsByDate, 'expense')
        .fold(0.0, (sum, e) => sum + e.amount);

    final income = _transactionRepository
        .filterTransactionsByType(transactionsByDate, 'income')
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
      expensesChange = ((expenses - previousExpenses) / previousExpenses) * 100;
    }

    double incomeChange = 0.0;
    if (previousIncome > 0) {
      incomeChange = ((income - previousIncome) / previousIncome) * 100;
    }

    return Statistics(
      totalIncome: income,
      totalExpenses: expenses,
      expensesPercentageChange: expensesChange,
      incomePercentageChange: incomeChange
    );
  }

  Future<void> getAllData () async{
    final transactions = await _transactionRepository.getAllTransaction();
    final  dayData =  await loadSortByType(transactions: transactions, period: 'day');
    final weekData = await loadSortByType(transactions: transactions, period: 'week');
    final monthData = await loadSortByType(transactions: transactions, period: 'month');

    emit(TransactionStateSummary(dayData: dayData, weekData: weekData, monthData: monthData, transactions: transactions,));
  }

}

