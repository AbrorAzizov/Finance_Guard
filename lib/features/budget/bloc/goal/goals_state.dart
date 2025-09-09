
import '../../data/entity/goal_entity.dart';


abstract class GoalsState {}

class GoalsInitial extends GoalsState {}

class GoalsLoading extends GoalsState {}

class GoalsLoaded extends GoalsState {
  final List<GoalEntity> goals;

  GoalsLoaded(this.goals);
}

class GoalsError extends GoalsState {
  final String message;
  GoalsError(this.message);
}
