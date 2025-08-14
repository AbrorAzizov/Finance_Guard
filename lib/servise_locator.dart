import 'package:finance_guard/features/home/data/repository/transaction_repo_imp.dart';
import 'package:finance_guard/features/home/domain/repository/transaction_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'features/home/data/model/transaction_model.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final box = await Hive.openBox<TransactionModel>('transactions');
  sl.registerSingleton<TransactionRepository>(TransactionRepoImp(box: box));
}