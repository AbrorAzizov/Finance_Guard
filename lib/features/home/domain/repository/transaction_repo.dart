import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';

abstract class TransactionRepository{
  Future<void> addTransaction(TransactionEntity transaction);
  Future<List<TransactionEntity>> getAllTransaction ();
  Future<void> deleteTransaction(String id);
}