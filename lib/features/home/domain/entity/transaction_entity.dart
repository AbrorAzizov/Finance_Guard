
class TransactionEntity {
  final String id;
  final double amount;
  final int iconCodePoint;
  final String iconFontFamily;
  final int categoryColor;
  final DateTime date;
  final String? comment;
  final String type; // expense / income

  TransactionEntity({
    required this.id,
    required this.amount,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.categoryColor,
    required this.date,
    this.comment,
    required this.type,
  });
}


