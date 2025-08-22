import 'package:finance_guard/features/home/domain/entity/statistics.dart';

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
  final List<TransactionEntity> transactions;

  TransactionStateLoaded({required this.transactions});
}



class TransactionStateError extends TransactionState {
  final String message;

  TransactionStateError(this.message);
}
