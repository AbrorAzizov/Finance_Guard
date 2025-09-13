class AiTransactionEntity {
  final String date;
  final double amount;
  final String name;
  final String? comment;

  AiTransactionEntity({
    required this.date,
    required this.amount,
    required this.name,
     this.comment,
  });

  Map<String, dynamic> toJson() => {
    "date": date,
    "amount": amount,
    "name": name,
   if(comment != null)  "comment": comment,
  };
}
