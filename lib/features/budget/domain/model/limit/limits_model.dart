import 'package:hive/hive.dart';
import '../../../data/entity/limits_entity.dart';
part 'limits_model.g.dart';

@HiveType(typeId: 3)
class LimitsModel {
  @HiveField(0)
  final double monthlyLimit;

  LimitsModel({required this.monthlyLimit});

  // Model → Entity
  LimitsEntity toEntity() {
    return LimitsEntity(monthlyLimit: monthlyLimit);
  }

  // Entity → Model
  factory LimitsModel.fromEntity(LimitsEntity entity) {
    return LimitsModel(monthlyLimit: entity.monthlyLimit);
  }
}
