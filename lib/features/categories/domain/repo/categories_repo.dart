import '../../data/category_entity.dart';

abstract class CategoriesRepo {
  Future<void> addDefaultCategories(List<CategoryEntity> categories);
  Future<void> addCategory (CategoryEntity category);
  Future<List<CategoryEntity>> getAllCategories();
  Future<void> deleteCategory(String id);
}