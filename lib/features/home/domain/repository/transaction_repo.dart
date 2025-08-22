import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';

abstract class TransactionRepository {
  Future<void> addTransaction(TransactionEntity transaction);

  Future<List<TransactionEntity>> getAllTransaction();

  Future<void> deleteTransaction(String id);

  List<TransactionEntity> filterTransactionsByDate(
      List<TransactionEntity> list, String period);

  List<TransactionEntity> filterTransactionsByType(
      List<TransactionEntity> transactions, String type);


  List<TransactionEntity> filterTransactionsByPreviousDate(
      List<TransactionEntity> transactions, String period);
}
