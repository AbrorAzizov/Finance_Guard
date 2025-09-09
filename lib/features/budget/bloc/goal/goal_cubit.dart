import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/entity/goal_entity.dart';
import '../../domain/repo/goal_repo_imp.dart';
import 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  final GoalsRepo repo;

  GoalsCubit( this.repo) : super(GoalsInitial());

  Future<void> addDefaultGoal() async {
    final goals = await repo.getGoals();
    if (goals.isEmpty){
      try {
        final goal = GoalEntity(id: '1', title: 'vacation', targetAmount: 0);
        await repo.addGoal(goal);
        await loadGoals();
      } catch (e) {
        emit(GoalsError(e.toString()));
      }
    }
  }
  
  Future<void> loadGoals() async {
    emit(GoalsLoading());
    try {
      final goals = await repo.getGoals();
      emit(GoalsLoaded(goals));
    } catch (e) {
      emit(GoalsError(e.toString()));
    }
  }

  Future<void> addGoal(GoalEntity goal) async {
    try {
      await repo.addGoal(goal);
      await loadGoals();
    } catch (e) {
      emit(GoalsError(e.toString()));
    }
  }

  Future<void> updateGoal(GoalEntity goal) async {
    try {
      await repo.updateGoal(goal);
      await loadGoals();
    } catch (e) {
      emit(GoalsError(e.toString()));
    }
  }

  Future<void> deleteGoal(String id) async {
    try {
      await repo.deleteGoal(id);
      await loadGoals();
    } catch (e) {
      emit(GoalsError(e.toString()));
    }
  }
}
