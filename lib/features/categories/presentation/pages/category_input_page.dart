import 'package:finance_guard/core/widgets/create_button.dart';
import 'package:finance_guard/core/widgets/selecting_category.dart';
import 'package:finance_guard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:finance_guard/features/categories/presentation/bloc/category_state.dart';
import 'package:finance_guard/features/categories/presentation/widgets/enter_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/back_button.dart';
import '../../data/entity/category_entity.dart';
import '../../data/entity/icon_entity.dart';
import '../widgets/selecting_icon.dart';

class CategoryInputPage extends StatefulWidget {
  const CategoryInputPage({super.key});

  @override
  State<CategoryInputPage> createState() => _CategoryInputPageState();
}

class _CategoryInputPageState extends State<CategoryInputPage> {
  IconEntity? selectedCategory; // хранение выбранной категории
  String categoryName = "";

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
                Text('Add Category', style: AppTextStyles.screenTitle),
                SizedBox(height: 30.h),

                /// Ввод названия категории
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
                      context.read<CategoryCubit>().addCategory(
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
