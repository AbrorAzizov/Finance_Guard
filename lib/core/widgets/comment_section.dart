import 'package:finance_guard/core/constants/app_colors.dart';
import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentInput extends StatelessWidget {
  final ValueChanged<String> onCommentChanged;
  final String? initialValue;

  const CommentInput({
    super.key,
    required this.onCommentChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialValue ?? '');

    return Container(
      height: 113.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Comment (unnecessary)", style: AppTextStyles.widgetLabel),
          SizedBox(height: 8.h),
          TextField(
            controller: controller,
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
              hintText: "My Comment.",
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
            onChanged: onCommentChanged,
          ),
        ],
      ),
    );
  }
}
