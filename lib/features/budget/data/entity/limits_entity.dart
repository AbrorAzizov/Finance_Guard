class LimitsEntity {
  final double monthlyLimit;

  LimitsEntity({required this.monthlyLimit});


  double get weeklyLimit => monthlyLimit / 4;
}
