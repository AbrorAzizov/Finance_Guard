
import 'package:bloc/bloc.dart';

import '../../../../servise_locator.dart';
import '../../domain/entity/transaction_entity.dart';
import '../../domain/repository/transaction_repo.dart';
import 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository _transactionRepository = sl<TransactionRepository>();

  TransactionCubit() : super(TransactionStateInitial());

  Future<void> loadTransactions() async {
    emit(TransactionStateLoading());
    try {
      final transactions = await _transactionRepository.getAllTransaction();
      emit(TransactionStateLoaded(transactions: transactions));
    } catch (e) {
      emit(TransactionStateError('Ошибка при загрузке транзакций: $e'));
    }
  }


  Future<void> createTransaction(TransactionEntity transaction) async {
    emit(TransactionStateLoading());
    try {
      await _transactionRepository.addTransaction(transaction);

      emit(TransactionStateCreated());
    } catch (e) {
      emit(TransactionStateError('Ошибка при создании транзакции: $e'));
    }
  }
}
