import 'package:finance_guard/features/categories/domain/repo/categories_repo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../../domain/model/categories_model.dart';
import '../entity/category_entity.dart';

class CategoriesRepoImp implements CategoriesRepo {
  Box<CategoryModel> box;

  CategoriesRepoImp({required this.box});

  @override
  Future<void> addDefaultCategories() async {
    final categories = [
      CategoryEntity(
        id: const Uuid().v4(),
        name: "Food",
        iconCodePoint: Icons.restaurant.codePoint,
        iconFontFamily: Icons.restaurant.fontFamily,
        color: Colors.orange.value,
        isTracked: true
      ),
      CategoryEntity(
        id: const Uuid().v4(),
        name: "Drink",
        iconCodePoint: Icons.local_drink.codePoint,
        iconFontFamily: Icons.local_drink.fontFamily,
        color: Colors.red.value,   isTracked: true
      ),
      CategoryEntity(
        id: const Uuid().v4(),
        name: "Rent",
        iconCodePoint: Icons.home_work_outlined.codePoint,
        iconFontFamily: Icons.home_work_outlined.fontFamily,
        color: Colors.purple.value,
          isTracked: true
      ),
      CategoryEntity(
        id: const Uuid().v4(),
        name: "Car",
        iconCodePoint: Icons.directions_car.codePoint,
        iconFontFamily: Icons.directions_car.fontFamily,
        color: Colors.indigo.value,   isTracked: true
      ),
    ];
      for (final category in categories) {
        final exists = box.values.any((element) => element.name ==  category.name,);
        if(!exists){
          await box.put(category.id, CategoryModel.fromEntity(category));
        }
    }
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    return box.values
        .map(
          (e) => e.toEntity(),
        )
        .toList();
  }


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
