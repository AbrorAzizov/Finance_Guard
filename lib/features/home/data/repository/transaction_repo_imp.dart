import 'package:finance_guard/features/home/data/model/transaction_model.dart';
import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';
import 'package:finance_guard/features/home/domain/repository/transaction_repo.dart';
import 'package:hive/hive.dart';

class TransactionRepoImp implements  TransactionRepository{
  final Box<TransactionModel> box;

  TransactionRepoImp({required this.box});

  @override
  Future<void> addTransaction(TransactionEntity transaction) async{
    final model = TransactionModel.fromEntity(transaction);
    await box.put(model.id, model);
  }

  @override
  Future<List<TransactionEntity>> getAllTransaction() async {
   return  box.values.map((e) => e.toEntity(),).toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await box.delete(id);
  }
  
}