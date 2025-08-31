import 'package:finance_guard/core/widgets/create_button.dart';
import 'package:finance_guard/features/categories/data/entity/category_entity.dart';
import 'package:finance_guard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:finance_guard/features/categories/presentation/bloc/category_state.dart';
import 'package:finance_guard/features/categories/presentation/widgets/enter_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/back_button.dart';

import '../../data/entity/icon_entity.dart';
import '../widgets/selecting_icon.dart';



class CategoryEdit extends StatefulWidget {
  final CategoryEntity categoryEntity;
  const CategoryEdit({super.key, required this.categoryEntity});

  @override
  State<CategoryEdit> createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  IconEntity? selectedCategory;
  late String categoryName ;

  @override
  void initState() {
    super.initState();
    categoryName = widget.categoryEntity.name; // set AFTER widget is ready ✅
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArrowBackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 30.h),
                Text('Edit Category', style: AppTextStyles.screenTitle),
                SizedBox(height: 30.h),


                CategoryInput(
                  onCategoryChanged: (value) {
                    setState(() {
                      categoryName = value;
                    });
                  },
                ),
                SizedBox(height: 20.h),

                /// Отображение иконок через BlocBuilder
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoaded) {
                      return SelectingIcon(
                        selectedIcon: selectedCategory,
                        onSelect: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      );
                    } else if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Text("No categories available");
                    }
                  },
                ),

                SizedBox(height: 40.h),
                CreateButton(
                  onPressed: () {
                    if (categoryName.isNotEmpty && selectedCategory != null) {
                      context.read<CategoryCubit>().editCategory(
                        widget.categoryEntity.id,
                          categoryName,
                          selectedCategory!.iconCodePoint,
                          selectedCategory?.iconFontFamily,
                          selectedCategory!.color);
                      context.read<CategoryCubit>().loadCategories();
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please enter name and select icon")),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }

