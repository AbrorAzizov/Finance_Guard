import '../../data/category_entity.dart';

abstract class CategoriesRepo {
  Future<void> addDefaultCategories();
  Future<void> addCategory (CategoryEntity category);
  Future<List<CategoryEntity>> getAllCategories();
  Future<void> deleteCategory(String id);
  Future<void> editCategory(CategoryEntity updatedCategory);
}