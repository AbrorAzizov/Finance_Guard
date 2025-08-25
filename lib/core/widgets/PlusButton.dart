import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class PlusButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlusButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: const BoxDecoration(
          color:  Color(0xFF16416A),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Icon(
          Icons.add,
          color: AppColors.textPrimary,
          size: 22.sp,
        ),
      ),
    );
  }
}
