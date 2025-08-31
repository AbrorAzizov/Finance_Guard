
import 'package:finance_guard/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../core/widgets/add_button.dart';

import '../bloc/categories_cubit.dart';
import '../bloc/category_state.dart';
import 'category_input_page.dart';


class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(17.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Category', style: AppTextStyles.screenTitle),
                Row(
                  children: [
                    AddCircleButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CategoryInputPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
              ],
            ),

            SizedBox(height: 40.h),
            Expanded(
              child: BlocBuilder<CategoryCubit,CategoryState>(
                builder: (context,state) {

                 if (state is CategoryLoaded){
                   final categories = state.categories;
                   return GridView.builder(
                     itemCount: categories.length,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2, // 2 карточки в ряд
                       mainAxisSpacing: 12.h,
                       crossAxisSpacing: 12.w,
                       childAspectRatio: 1,
                     ),
                     itemBuilder: (context, index) {
                       final category = categories[index];
                       return Container(
                         padding: EdgeInsets.all(16.r),
                         decoration: BoxDecoration(
                           color: AppColors.cardBackground,
                           borderRadius: BorderRadius.circular(20.r),
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Container(

                                   padding: EdgeInsets.all(15.r),
                                   decoration: BoxDecoration(
                                     color: Color(category.color), // цвет категории
                                     shape: BoxShape.circle,
                                   ),
                                   child: Icon(
                                     IconData(
                                       category.iconCodePoint,
                                       fontFamily: category.iconFontFamily,
                                     ),
                                     color: Colors.white,
                                     size: 22.sp,
                                   ),
                                 ),
                                 Row(
                                   children: [
                                     Switch(
                                       value: category.isTracked, // текущее значение
                                       onChanged: (value) async {
                                         context.read<CategoryCubit>().switchState(category, value);

                                       },
                                       activeColor: AppColors.buttonColor,
                                     ),
                                     Text(
                                       "On",
                                       style: TextStyle(
                                         color: AppColors.buttonColor,
                                         fontWeight: FontWeight.w600,
                                         fontSize: 14.sp,
                                       ),
                                     )
                                   ],
                                 )
                               ],
                             ),

                             SizedBox(height: 12.h),


                             Text(
                               category.name,
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 16.sp,
                                 fontWeight: FontWeight.w600,
                               ),
                             ),

                             const Spacer(),

                             // Нижние кнопки
                             Row(
                               children: [
                                 // Кнопка Edit
                                 Expanded(
                                   child: ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                       backgroundColor: AppColors.buttonColor,
                                       foregroundColor: Colors.black,
                                       padding: EdgeInsets.symmetric(vertical: 12.h),
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(12.r),
                                       ),
                                     ),
                                     onPressed: () {

                                     },
                                     child: const Text("Edit"),
                                   ),
                                 ),
                                 SizedBox(width: 8.w),

                                 Container(
                                   decoration: BoxDecoration(
                                     color: const Color(0xFF143A5A),
                                     borderRadius: BorderRadius.circular(12.r),
                                   ),
                                   child: InkWell(
                                     borderRadius: BorderRadius.circular(12.r),
                                     onTap: () {

                                     },
                                     child: Padding(
                                       padding: EdgeInsets.all(10.r),
                                       child: const Icon(Icons.delete_outline, color: Colors.white ,size: 26,),
                                     ),
                                   ),
                                 )
                               ],
                             )
                           ],
                         ),
                       );
                     },
                   );

                 }
                 return Center(child: CircularProgressIndicator(),);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}