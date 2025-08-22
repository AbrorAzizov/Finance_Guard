abstract class BalanceRepo {
  double getTotal();
  Future<void> saveTotal(double amount);

}
