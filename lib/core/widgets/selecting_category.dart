import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/categories/data/category_entity.dart';
import '../constants/app_colors.dart';



class SelectingCategory extends StatelessWidget {
  final CategoryEntity? selectedCategory;
  final ValueChanged<CategoryEntity> onSelect;
  final List<CategoryEntity> categories;

  const SelectingCategory({
    super.key,
    required this.selectedCategory,
    required this.onSelect,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Category', style: AppTextStyles.widgetLabel),
          SizedBox(height: 8.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 6.w,
              mainAxisSpacing: 6.h,
              childAspectRatio: 2.1,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category.id == selectedCategory?.id;
              print(categories.length);
              return GestureDetector(
                onTap: () => onSelect(category),
                child: Container(
                  height: 32.h,
                  width: 72.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.lightBlueAccent
                        : AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          IconData(
                            category.iconCodePoint,
                            fontFamily: category.iconFontFamily,
                          ),
                          size: 14.h,
                          color: Colors.black,
                        ),
                        maxRadius: 14.r,
                        backgroundColor: Color(category.color),
                      ),
                      SizedBox(width: 5.w),
                      Flexible(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 3.h),
          SizedBox(
            height: 32.h,
            width: 72.w,
            child: GestureDetector(
              onTap: () {
                // TODO: добавить логику добавления категории
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.add, size: 14.h, color: Colors.black),
                    maxRadius: 14,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
