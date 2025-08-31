
import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';

class Statistics {
  final double totalIncome;
  final double totalExpenses;
  final double expensesPercentageChange;
  final double incomePercentageChange;
  final List<TransactionEntity> expenses;
  final List<TransactionEntity> incomes;

  Statistics(
      {
        required this.incomes,
        required this.expenses,
        required this.totalIncome,
      required this.totalExpenses,
      required this.expensesPercentageChange,
      required this.incomePercentageChange});
}
