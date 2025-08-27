import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../data/category_entity.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final List<CategoryEntity> _categories = [];

  CategoryCubit() : super(CategoryInitial());

  void loadDefaultCategories() {
    if (_categories.isEmpty) {
      _categories.addAll([
        CategoryEntity(
          id: const Uuid().v4(),
          name: "Food",
          iconCodePoint: Icons.restaurant.codePoint,
          iconFontFamily: Icons.restaurant.fontFamily,
          color: Colors.orange.value,
        ),
        CategoryEntity(
          id: const Uuid().v4(),
          name: "Drink",
          iconCodePoint: Icons.local_drink.codePoint,
          iconFontFamily: Icons.local_drink.fontFamily,
          color: Colors.red.value,
        ),
        CategoryEntity(
          id: const Uuid().v4(),
          name: "Rent",
          iconCodePoint: Icons.home_work_outlined.codePoint,
          iconFontFamily: Icons.home_work_outlined.fontFamily,
          color: Colors.purple.value,
        ),
        CategoryEntity(
          id: const Uuid().v4(),
          name: "Car",
          iconCodePoint: Icons.directions_car.codePoint,
          iconFontFamily: Icons.directions_car.fontFamily,
          color: Colors.indigo.value,
        ),
      ]);
    }

    emit(CategoryLoaded(List.from(_categories)));
  }

  void addCategory(String name, int iconCodePoint, String? fontFamily, int color) {
    final category = CategoryEntity(
      id: const Uuid().v4(),
      name: name,
      iconCodePoint: iconCodePoint,
      iconFontFamily: fontFamily,
      color: color,
    );

    _categories.add(category);
    emit(CategoryLoaded(List.from(_categories)));
  }

  List<CategoryEntity> get categories => List.unmodifiable(_categories);
}
