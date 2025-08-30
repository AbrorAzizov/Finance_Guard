import 'package:finance_guard/features/categories/domain/model/categories_model.dart';
import 'package:finance_guard/features/home/bloc/transaction_bloc/transaction_cubit.dart';
import 'package:finance_guard/features/home/data/repository/transaction_repo_imp.dart';
import 'package:finance_guard/features/home/domain/repository/transaction_repo.dart';
import 'package:finance_guard/features/welcome%20&%20balance%20cubit/repo/balance_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'features/categories/data/repository/categories_repo_imp.dart';
import 'features/categories/domain/repo/categories_repo.dart';
import 'features/categories/presentation/bloc/categories_cubit.dart';
import 'features/home/data/model/transaction_model.dart';
import 'features/welcome & balance cubit/repo/balance_repo_imp.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final box = await Hive.openBox<TransactionModel>('transactions');
  sl.registerSingleton<TransactionRepository>(
    TransactionRepoImp(box: box),
  );

  final balanceBox = await Hive.openBox<double>('balanceBox');
  sl.registerSingleton<BalanceRepo>(BalanceRepositoryImp(balanceBox));

  final categoryBox = await Hive.openBox<CategoryModel>('categoriesBox');
  sl.registerSingleton<CategoriesRepo>(CategoriesRepoImp(box: categoryBox));


  sl.registerFactory(() => CategoryCubit(sl<CategoriesRepo>()));

  sl.registerSingleton<TransactionCubit>(TransactionCubit());

}
