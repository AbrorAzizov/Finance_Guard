import 'package:finance_guard/core/widgets/enter_amount.dart';
import 'package:flutter/material.dart';
import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/core/widgets/back_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import '../../../core/widgets/create_button.dart';
import '../bloc/goal/goal_cubit.dart';
import '../data/entity/goal_entity.dart';
import '../widgets/goal_editing_field.dart';





class AddGoalPage extends StatefulWidget {
  const AddGoalPage({super.key});

  @override
  State<AddGoalPage> createState() => _AddGoalPageState();
}

class _AddGoalPageState extends State<AddGoalPage> {
  String goalName = "";
  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              GoalNameInput(
                onGoalNameChanged: (value) {
                  setState(() {
                    goalName = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              CurrencyInput(
                selectedAmount: (value) {
                  setState(() {
                    amount = value;
                  });
                },
              ),
              Spacer(),
              CreateButton(
                onPressed: () {
                  final goal = GoalEntity(
                    id: Uuid().v4(),
                    title: goalName,
                    targetAmount: double.parse(amount) ,
                  );
                  context.read<GoalsCubit>().updateGoal(goal);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
