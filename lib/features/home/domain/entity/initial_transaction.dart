class InitialTransactionEntity {
  final String id;
  final double amount;
  final DateTime date;
  final String type; // expense/income
  final String? comment;
  final String categoryId;

  InitialTransactionEntity({
    required this.id,
    required this.amount,
    required this.date,
    required this.type,
    this.comment,
    required this.categoryId,

  });
}
