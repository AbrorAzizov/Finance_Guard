import 'package:hive/hive.dart';

import '../../domain/model/goal/goal_model.dart';
import '../../domain/repo/goal_repo_imp.dart';
import '../entity/goal_entity.dart';




class GoalsRepoImpl implements GoalsRepo {
  final Box<GoalModel> box;

  GoalsRepoImpl({required this.box});

  @override
  Future<List<GoalEntity>> getGoals() async {
    return box.values.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> addGoal(GoalEntity goal) async {
    await box.put(goal.id, GoalModel.fromEntity(goal));
  }

  @override
  Future<void> updateGoal(GoalEntity goal) async {
    await box.put(goal.id, GoalModel.fromEntity(goal));
  }

  @override
  Future<void> deleteGoal(String id) async {
    await box.delete(id);
  }
}