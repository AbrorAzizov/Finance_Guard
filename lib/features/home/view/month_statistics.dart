import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/core/dialog/loading_dialog.dart';
import 'package:finance_guard/features/home/bloc/transaction_bloc/transaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/wach_all_button.dart';
import '../bloc/transaction_bloc/transaction_cubit.dart';

class MonthStatistics extends StatefulWidget {
  final double total;
  const MonthStatistics({super.key, required this.total});

  @override
  State<MonthStatistics> createState() => _MonthStatisticsState();
}

class _MonthStatisticsState extends State<MonthStatistics> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionStateSummary) {
          final dayData = state.monthData;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- My account card ---
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My account', style: AppTextStyles.widgetLabel),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.total.toStringAsFixed(2)}",
                          style: AppTextStyles.accountBalance,
                        ),

                        Text(
                          dayData.expensesPercentageChange >= 0
                              ? "+${dayData.incomePercentageChange.toStringAsFixed(2)}%"
                              : "-${dayData.incomePercentageChange.toStringAsFixed(2)}%",
                          style: dayData.incomePercentageChange >= 0
                              ? AppTextStyles.percentageChangePositive
                              : AppTextStyles.percentageChangeNegative,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // --- Total amount section ---
              Text('Total amount', style: AppTextStyles.statsTitle),
              SizedBox(height: 12.h),

              Row(
                children: [
                  // --- Expenses card ---
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Expenses", style: AppTextStyles.widgetLabel,),
                              Text(
                                dayData.expensesPercentageChange >= 0
                                    ? "+${dayData.expensesPercentageChange.toStringAsFixed(2)}%"
                                    : "-${dayData.expensesPercentageChange.toStringAsFixed(2)}%",
                                style: dayData.expensesPercentageChange >= 0
                                    ? AppTextStyles.percentageChangePositive
                                    : AppTextStyles.percentageChangeNegative,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            dayData.totalExpenses.toStringAsFixed(2),
                            style: AppTextStyles.accountBalance.copyWith(fontSize: 20.sp),
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            width: double.infinity,
                            child: WatchAllButton(onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // --- Income card ---
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Income", style: AppTextStyles.widgetLabel,),
                              Text(
                                dayData.incomePercentageChange >= 0
                                    ? "+${dayData.incomePercentageChange.toStringAsFixed(2)}%"
                                    : "-${dayData.incomePercentageChange.toStringAsFixed(2)}%",
                                style: dayData.incomePercentageChange >= 0
                                    ? AppTextStyles.percentageChangePositive
                                    : AppTextStyles.percentageChangeNegative,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            dayData.totalIncome.toStringAsFixed(2),
                            style: AppTextStyles.accountBalance.copyWith(fontSize: 20.sp),
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            width: double.infinity,
                            child: WatchAllButton(onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (state is TransactionStateLoading) {
          return const Center(child: Loading());
        } else if (state is TransactionStateError) {
          return Center(
            child: Text(state.message,
                style: const TextStyle(color: Colors.red)),
          );
        }
        return const SizedBox(); // initial
      },
    );
  }
}
