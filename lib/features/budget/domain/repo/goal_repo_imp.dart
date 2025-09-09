import '../../data/entity/goal_entity.dart';

abstract class GoalsRepo {
  Future<List<GoalEntity>> getGoals();
  Future<void> addGoal(GoalEntity goal);
  Future<void> updateGoal(GoalEntity goal);
  Future<void> deleteGoal(String id);
}

