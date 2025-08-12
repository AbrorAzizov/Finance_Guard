import 'package:hive/hive.dart';

import '../../domain/entity/transaction_entity.dart';

@HiveType(typeId: 0)
class TransactionModel {
  @HiveField(0) final String id;
  @HiveField(1) final double amount;
  @HiveField(2) final int iconCodePoint;
  @HiveField(3) final String iconFontFamily;
  @HiveField(4) final int categoryColor;
  @HiveField(5) final DateTime date;
  @HiveField(6) final String? comment;
  @HiveField(7) final String type;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.categoryColor,
    required this.date,
    this.comment,
    required this.type,
  });

  TransactionEntity toEntity() => TransactionEntity(
    id: id,
    amount: amount,
    iconCodePoint: iconCodePoint,
    iconFontFamily: iconFontFamily,
    categoryColor: categoryColor,
    date: date,
    comment: comment,
    type: type,
  );

  factory TransactionModel.fromEntity(TransactionEntity entity) =>
      TransactionModel(
        id: entity.id,
        amount: entity.amount,
        iconCodePoint: entity.iconCodePoint,
        iconFontFamily: entity.iconFontFamily,
        categoryColor: entity.categoryColor,
        date: entity.date,
        comment: entity.comment,
        type: entity.type,
      );
}
