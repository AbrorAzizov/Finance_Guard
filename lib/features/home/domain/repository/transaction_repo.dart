import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';

import '../entity/initial_transaction.dart';

abstract class TransactionRepository {
  Future<void> addTransaction(InitialTransactionEntity transaction);

  Future<List<InitialTransactionEntity>> getAllTransaction();

  Future<void> deleteTransaction(String id);

  List<TransactionEntity> filterTransactionsByDate(
      List<TransactionEntity> list, String period);

  List<TransactionEntity> filterTransactionsByType(
      List<TransactionEntity> transactions, String type);


  List<TransactionEntity> filterTransactionsByPreviousDate(
      List<TransactionEntity> transactions, String period);
}
