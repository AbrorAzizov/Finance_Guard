import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AllButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AllButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 33.h,
        width: 50.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: const BoxDecoration(
          color: Color(0xFF16416A),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            "All",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
