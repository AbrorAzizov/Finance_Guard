import 'package:finance_guard/features/categories/domain/repo/categories_repo.dart';
import 'package:hive/hive.dart';

import '../../domain/model/categories_model.dart';
import '../category_entity.dart';

class CategoriesRepoImp implements CategoriesRepo{
 Box<CategoryModel> box;
 CategoriesRepoImp({required this.box});


 @override
 Future<void> addDefaultCategories(List<CategoryEntity> categories) async {
  for(final category in categories ){
   await box.put(category.id, CategoryModel.fromEntity(category));
  }
 }

 @override
 Future<List<CategoryEntity>> getAllCategories() async {
  return box.values.map((e) => e.toEntity(),).toList();
 }

 @override
 Future<void> deleteCategory(String id) async {
  await box.delete(id);
 }

  @override
  Future<void> addCategory(CategoryEntity category) async{
   final alreadyExists = box.values.any((c) => c.name == category.name);

   if (!alreadyExists) {
    await box.put(category.id, CategoryModel.fromEntity(category));
   }
  }


}