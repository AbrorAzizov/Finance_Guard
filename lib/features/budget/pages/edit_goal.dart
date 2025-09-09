import 'package:finance_guard/core/widgets/enter_amount.dart';
import 'package:flutter/material.dart';
import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/core/widgets/back_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/create_button.dart';
import '../../categories/presentation/widgets/enter_category.dart';




class EditGoal extends StatefulWidget {

  const EditGoal({super.key});

  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
  String goalName = "";
  String amount = '';

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
                Text('Add Goal', style: AppTextStyles.screenTitle),
                SizedBox(height: 30.h),

                /// Ввод названия категории
                CategoryInput(
                  onCategoryChanged: (value) {
                    setState(() {
                      goalName = value;
                    });
                  },
                ),
                SizedBox(height: 20.h),

                CurrencyInput(selectedAmount: (value) {
                  setState(() {
                    amount = value;
                  });
                },),

                CreateButton(
                  onPressed: () {

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
