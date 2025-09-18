import 'package:finance_guard/features/budget/bloc/goal/goal_cubit.dart';
import 'package:finance_guard/features/budget/data/repository/limits_repo_impl.dart';
import 'package:finance_guard/features/budget/domain/model/limit/limits_model.dart';
import 'package:finance_guard/features/budget/domain/repo/goal_repo_imp.dart';
import 'package:finance_guard/features/categories/domain/model/categories_model.dart';
import 'package:finance_guard/features/chat/bloc/chat_cubit.dart';
import 'package:finance_guard/features/chat/data/service/chat_service.dart';
import 'package:finance_guard/features/home/bloc/transaction_bloc/transaction_cubit.dart';
import 'package:finance_guard/features/home/data/repository/transaction_repo_imp.dart';
import 'package:finance_guard/features/home/domain/repository/transaction_repo.dart';
import 'package:finance_guard/features/welcome%20&%20balance%20cubit/repo/balance_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'features/budget/data/repository/goal_repo.dart';
import 'features/budget/domain/model/goal/goal_model.dart';
import 'features/budget/domain/repo/limits_repo_imp.dart';
import 'features/categories/data/repository/categories_repo_imp.dart';
import 'features/categories/domain/repo/categories_repo.dart';
import 'features/categories/presentation/bloc/categories_cubit.dart';
import 'features/chat/data/repository/chat_repo_imp.dart';
import 'features/chat/domain/repo/chat_repo.dart';
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

  final limitsBox = await Hive.openBox<LimitsModel>('limitsBox');
  sl.registerSingleton<LimitsRepo>(LimitsRepoImpl(box: limitsBox));

  final goalBox = await Hive.openBox<GoalModel>('goalsBox');
  sl.registerSingleton<GoalsRepo>(GoalsRepoImpl(box: goalBox));


  sl.registerSingleton<DeepSeekCloudService>(DeepSeekCloudService());

  sl.registerSingleton<ChatRepo>(
    ChatRepoImp(sl<DeepSeekCloudService>()),
  );


  sl.registerFactory(() => ChatCubit(sl<ChatRepo>()));

  sl.registerFactory(() => CategoryCubit(sl<CategoriesRepo>()));

  sl.registerSingleton(GoalsCubit(sl<GoalsRepo>()));

  sl.registerSingleton<TransactionCubit>(TransactionCubit());

}
