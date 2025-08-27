class TransactionEntity {
  final String id;
  final double amount;
  final int iconCodePoint;
  final String? iconFontFamily;
  final int categoryColor;
  final DateTime date;
  final String? comment;
  final String type;
  final String name;


  TransactionEntity({

    required this.id,
    required this.amount,
    required this.iconCodePoint,
    this.iconFontFamily,
    required this.categoryColor,
    required this.date,
    this.comment,
    required this.type,
    required this.name,
  });
}