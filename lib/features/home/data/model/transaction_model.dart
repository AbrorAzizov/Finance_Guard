
import 'package:hive/hive.dart';
import '../../domain/entity/initial_transaction.dart';

part 'transaction_model.g.dart';


@HiveType(typeId: 0)
class TransactionModel {
  @HiveField(0) final String id;
  @HiveField(1) final double amount;
  @HiveField(2) final DateTime date;
  @HiveField(3) final String type; // expense/income
  @HiveField(4) final String? comment;
  @HiveField(5) final String categoryId;
  @HiveField(6) final bool isTracked;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.type,
    this.comment,
    required this.categoryId,
    this.isTracked = true,
  });

  InitialTransactionEntity toEntity() => InitialTransactionEntity(
    id: id,
    amount: amount,
    date: date,
    type: type,
    comment: comment,
    categoryId: categoryId,
    isTracked: isTracked,
  );

  factory TransactionModel.fromEntity(InitialTransactionEntity entity) =>
      TransactionModel(
        id: entity.id,
        amount: entity.amount,
        date: entity.date,
        type: entity.type,
        comment: entity.comment,
        categoryId: entity.categoryId,
        isTracked: entity.isTracked,
      );
}
