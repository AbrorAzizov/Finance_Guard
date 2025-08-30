import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

import '../../data/category_entity.dart';

part 'categories_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int iconCodePoint;

  @HiveField(3)
  final String? iconFontFamily;

  @HiveField(4)
  final int color;

  @HiveField(5)
  final bool isTracked;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconCodePoint,
    this.iconFontFamily,
    required this.color,
    this.isTracked = true, // 👈 теперь по умолчанию TRUE
  });

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      iconCodePoint: iconCodePoint,
      iconFontFamily: iconFontFamily,
      color: color,
      isTracked: isTracked,
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      iconCodePoint: entity.iconCodePoint,
      iconFontFamily: entity.iconFontFamily,
      color: entity.color,
      isTracked: entity.isTracked,
    );
  }

  IconData get icon => IconData(iconCodePoint, fontFamily: iconFontFamily);
  Color get categoryColor => Color(color);
}
