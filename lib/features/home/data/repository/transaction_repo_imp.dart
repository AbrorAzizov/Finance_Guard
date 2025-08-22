import 'package:finance_guard/features/home/data/model/transaction_model.dart';
import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';
import 'package:finance_guard/features/home/domain/repository/transaction_repo.dart';
import 'package:hive/hive.dart';
class TransactionRepoImp implements  TransactionRepository {
  final Box<TransactionModel> box;

  TransactionRepoImp({required this.box});

  @override
  Future<void> addTransaction(TransactionEntity transaction) async {
    final model = TransactionModel.fromEntity(transaction);
    await box.put(model.id, model);
  }

  @override
  Future<List<TransactionEntity>> getAllTransaction() async {
    return box.values.map((e) => e.toEntity(),).toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await box.delete(id);
  }

  List<TransactionEntity> filterTransactionsByDate(
      List<TransactionEntity> transactions, String period) {
    final now = DateTime.now();

    return transactions.where((element) {
      final date = element.date;
      switch (period) {
        case 'day': // сегодня
          return date.year == now.year &&
              date.month == now.month &&
              date.day == now.day;

        case 'week': // последние 7 дней
          final weekAgo = now.subtract(Duration(days: 7));
          return date.year == now.year &&
              date.isAfter(weekAgo) && date.isBefore(now.add(Duration(days: 1)));
        case 'month':
          return date.year == now.year &&
          date.month == now.month;

        default:
          return false;
      }
    }).toList();
  }


  List<TransactionEntity> filterTransactionsByPreviousDate(
      List<TransactionEntity> transactions, String period) {
    final now = DateTime.now();

    return transactions.where((element) {
      final date = element.date;

      switch (period) {
        case 'day':
          final yesterday = now.subtract(const Duration(days: 1));
          return date.year == yesterday.year &&
              date.month == yesterday.month &&
              date.day == yesterday.day;

        case 'week':
          final startOfThisWeek = now.subtract(Duration(days: now.weekday - 1));
          final startOfPrevWeek = startOfThisWeek.subtract(const Duration(days: 7));
          final endOfPrevWeek = startOfThisWeek.subtract(const Duration(days: 1));

          return !date.isBefore(startOfPrevWeek) &&
              !date.isAfter(endOfPrevWeek);

        case 'month':
          final startOfThisMonth = DateTime(now.year, now.month, 1);
          final startOfPrevMonth = DateTime(now.year, now.month - 1, 1);
          final endOfPrevMonth = startOfThisMonth.subtract(const Duration(days: 1));

          return !date.isBefore(startOfPrevMonth) &&
              !date.isAfter(endOfPrevMonth);

        default:
          return false;
      }
    }).toList();
  }



  List<TransactionEntity> filterTransactionsByType(
      List<TransactionEntity> transactions, String type) {

    return transactions.where((element) {
      return element.type == type;
    }).toList();
  }

}