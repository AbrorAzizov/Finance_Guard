import 'package:finance_guard/features/categories/domain/repo/categories_repo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../../domain/model/categories_model.dart';
import '../entity/category_entity.dart';

class CategoriesRepoImp implements CategoriesRepo {
  final Box<CategoryModel> box;

  CategoriesRepoImp({required this.box});

  // ✅ Конвертация цвета в int без использования .value
  int colorToInt(Color color) {
    final int a = color.a.toInt();
    final int r = color.r.toInt();
    final int g = color.g.toInt();
    final int b = color.b.toInt();
    return (a << 24) | (r << 16) | (g << 8) | b;
  }

  @override
  Future<void> addDefaultCategories() async {
    final categories = [
      CategoryEntity(
        id: const Uuid().v4(),
        name: "Food",
        iconCodePoint: Icons.restaurant.codePoint,
        iconFontFamily: Icons.restaurant.fontFamily,
        color: colorToInt(Colors.orange),
        isTracked: true,
      ),
      CategoryEntity(
        id: const Uuid().v4(),
        name: "Drink",
        iconCodePoint: Icons.local_drink.codePoint,
        iconFontFamily: Icons.local_drink.fontFamily,
        color: colorToInt(Colors.red),
        isTracked: true,
      ),
      CategoryEntity(
        id: const Uuid().v4(),
        name: "Rent",
        iconCodePoint: Icons.home_work_outlined.codePoint,
        iconFontFamily: Icons.home_work_outlined.fontFamily,
        color: colorToInt(Colors.purple),
        isTracked: true,
      ),
      CategoryEntity(
        id: const Uuid().v4(),
        name: "Car",
        iconCodePoint: Icons.directions_car.codePoint,
        iconFontFamily: Icons.directions_car.fontFamily,
        color: colorToInt(Colors.indigo),
        isTracked: true,
      ),
    ];

    for (final category in categories) {
      final exists = box.values.any((element) => element.name == category.name);
      if (!exists) {
        await box.put(category.id, CategoryModel.fromEntity(category));
      }
    }
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    return box.values.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> deleteCategory(String id) async {
    await box.delete(id);
  }

  @override
  Future<void> editCategory(CategoryEntity updatedCategory) async {
    await box.put(updatedCategory.id, CategoryModel.fromEntity(updatedCategory));
  }

  @override
  Future<void> addCategory(CategoryEntity category) async {
    final alreadyExists = box.values.any((c) => c.name == category.name);
    if (!alreadyExists) {
      await box.put(category.id, CategoryModel.fromEntity(category));
    }
  }
}
