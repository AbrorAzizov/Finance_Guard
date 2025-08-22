import 'package:hive/hive.dart';

import 'balance_repo.dart';

class BalanceRepositoryImp implements BalanceRepo {
  final Box<double> balanceBox;
  BalanceRepositoryImp(this.balanceBox);

  @override
  Future<void> saveTotal(double total) async {
    await balanceBox.put('total', total);
  }

  @override
  double getTotal() {
    return balanceBox.get('total', defaultValue: 0.0) as double;
  }

}
