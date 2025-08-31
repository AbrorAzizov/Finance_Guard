import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';


import '../../data/entity/category_entity.dart';
import '../../domain/repo/categories_repo.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoriesRepo _categoryRepository;

  CategoryCubit(this._categoryRepository) : super(CategoryInitial());


  Future<void> loadDefaultCategories() async {
    await _categoryRepository.addDefaultCategories();
  }

  void addCategory(String name, int iconCodePoint, String? fontFamily,
      int color) async {
    final category = CategoryEntity(
      isTracked: true,
      id: const Uuid().v4(),
      name: name,
      iconCodePoint: iconCodePoint,
      iconFontFamily: fontFamily,
      color: color,
    );

    await _categoryRepository.addCategory(category);
  }

  Future<void> loadCategories() async {
    final categories = await _categoryRepository.getAllCategories();
    emit(CategoryLoaded(categories));
  }

  Future<void> switchState(CategoryEntity category, bool value) async {
    final updatedCategory = CategoryEntity(
      id: category.id,
      name: category.name,
      iconCodePoint: category.iconCodePoint,
      color: category.color,
      iconFontFamily: category.iconFontFamily,
      isTracked: value,
    );

    await _categoryRepository.editCategory(updatedCategory);

    final categories = await _categoryRepository.getAllCategories();

    emit(CategoryLoaded(categories ));

  }


}
