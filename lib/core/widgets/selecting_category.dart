import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  const Category({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class SelectingCategory extends StatelessWidget {
  final Category? selectedCategory;
  final ValueChanged<Category> onSelect;

  const SelectingCategory({
    super.key,
    required this.selectedCategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final categories = const [
      Category(name: 'Food', icon: Icons.restaurant, color: Colors.orange),
      Category(name: 'Drink', icon: Icons.local_drink, color: Colors.red),
      Category(name: 'Rent', icon: Icons.home_work_outlined, color: Colors.purple),
      Category(name: 'Car', icon: Icons.directions_car, color: Colors.cyan),
    ];

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
          SizedBox(height: 5.h),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // чтобы не было скролла
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category == selectedCategory;

              return GestureDetector(
                onTap: () => onSelect(category),
                child: Container(
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
                        child: Icon(category.icon,
                            size: 14.h.w, color: Colors.black),
                        maxRadius: 14,
                        backgroundColor: category.color,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        category.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(Icons.add, size: 14.h.w, color: Colors.black),
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
          )
        ],
      ),
    );

  }
}
