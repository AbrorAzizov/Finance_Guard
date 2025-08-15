import '../../domain/entity/transaction_entity.dart';

abstract class TransactionState {}

class TransactionStateInitial extends TransactionState {}

class TransactionStateLoading extends TransactionState {}

class TransactionStateCreated extends TransactionState {}


class TransactionStateLoaded extends TransactionState {
  final List<TransactionEntity> transactions;

  TransactionStateLoaded({required this.transactions});
}

class TransactionStateError extends TransactionState {
  final String message;

  TransactionStateError(this.message);
}
