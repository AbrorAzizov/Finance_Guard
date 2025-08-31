import 'package:finance_guard/features/categories/data/entity/category_entity.dart';
import 'package:finance_guard/features/home/domain/entity/statistics.dart';

import '../../domain/entity/initial_transaction.dart';
import '../../domain/entity/transaction_entity.dart';

abstract class TransactionState {}

class TransactionStateInitial extends TransactionState {}

class TransactionStateLoading extends TransactionState {}

class TransactionStateSummary extends TransactionState {
  final Statistics dayData;
  final Statistics weekData;
  final Statistics monthData;
  final List<TransactionEntity> transactions;

  TransactionStateSummary({required this.transactions,required this.dayData,
    required this.weekData, required this.monthData});


}
class TransactionStateCreated extends TransactionState {}


class TransactionStateLoaded extends TransactionState {
  final List<InitialTransactionEntity> transactions;
  final List<CategoryEntity> categories;

  TransactionStateLoaded({required this.transactions,required this.categories});
}



class TransactionStateError extends TransactionState {
  final String message;

  TransactionStateError(this.message);
}
