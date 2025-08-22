import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../constants/app_colors.dart';
import '../constants/text_styles.dart';

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;
  const DatePicker({super.key, required this.onDateSelected});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  _showDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate,
            onDateTimeChanged: (value) {
              setState(() {
                selectedDate = value;
              });
              // ⬅️ передаём выбранную дату наружу
              widget.onDateSelected(value);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDatePicker,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.w),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20.r),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter date', style: AppTextStyles.widgetLabel),
            const SizedBox(height: 8),
            Text(
              DateFormat('dd/MM/yyyy').format(selectedDate),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 3.h),
            const Divider(thickness: 2),
          ],
        ),
      ),
    );
  }
}
