import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class SelectingCategory extends StatelessWidget {
  const SelectingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.w),
      height: 160.h ,
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text('Select Category',style: AppTextStyles.widgetLabel,),
          SizedBox(height: 10.h,),
          Text('food')
        ],
      ),
    );
  }
}
