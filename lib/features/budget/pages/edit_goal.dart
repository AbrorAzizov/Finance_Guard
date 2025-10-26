import 'package:finance_guard/core/widgets/enter_amount.dart';
import 'package:finance_guard/features/budget/bloc/goal/goal_cubit.dart';
import 'package:finance_guard/features/budget/data/entity/goal_entity.dart';
import 'package:flutter/material.dart';
import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/core/widgets/back_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/create_button.dart';
import '../widgets/goal_editing_field.dart';

class EditGoal extends StatefulWidget {
  final String id;

  const EditGoal({super.key, required this.id});

  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Edit Goal', style: AppTextStyles.screenTitle),
                  IconButton(onPressed:() {
                    context.read<GoalsCubit>().deleteGoal(widget.id);
                    Navigator.pop(context);
                  }, icon: Icon(Icons.delete))
                ],
              ),
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
                    id: widget.id,
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
