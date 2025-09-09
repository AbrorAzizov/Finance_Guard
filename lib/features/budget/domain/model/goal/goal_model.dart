import 'package:hive/hive.dart';
import '../../../data/entity/goal_entity.dart';

part 'goal_model.g.dart';

@HiveType(typeId: 4)
class GoalModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double targetAmount;

  GoalModel({
    required this.id,
    required this.title,
    required this.targetAmount,
  });

  // --- Конвертация в Entity ---
  GoalEntity toEntity() {
    return GoalEntity(
      id: id,
      title: title,
      targetAmount: targetAmount,
    );
  }

  // --- Создание из Entity ---
  factory GoalModel.fromEntity(GoalEntity entity) {
    return GoalModel(
      id: entity.id,
      title: entity.title,
      targetAmount: entity.targetAmount,
    );
  }
}
