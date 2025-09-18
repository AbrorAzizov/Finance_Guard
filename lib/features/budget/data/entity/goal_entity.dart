class GoalEntity {
  final String id;
  final String title;
  final double targetAmount;

  GoalEntity({
    required this.id,
    required this.title,
    required this.targetAmount,
  });

  Map<String,dynamic> toJson() =>{
    "title": title,
    "targetAmount":targetAmount
  };
}
