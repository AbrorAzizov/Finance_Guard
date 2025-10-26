
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/dialog/loading_dialog.dart';

import '../../../core/widgets/transaction_card.dart';
import '../../home/bloc/transaction_bloc/transaction_cubit.dart';
import '../../home/bloc/transaction_bloc/transaction_state.dart';

class IncomeHistoryView extends StatelessWidget {
  const IncomeHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionStateSummary) {
          final data = state.monthData;

          return SingleChildScrollView(
            child: Column(
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
                            "\$${data.totalIncome.toStringAsFixed(2)}",
                            style: AppTextStyles.accountBalance,
                          ),
                          Text(
                            data.incomePercentageChange >= 0
                                ? "+${data.incomePercentageChange.toStringAsFixed(2)}%"
                                : "${data.incomePercentageChange.toStringAsFixed(2)}%",
                            style: data.incomePercentageChange >= 0
                                ? AppTextStyles.percentageChangePositive
                                : AppTextStyles.percentageChangeNegative,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // --- Total amount section ---
                SizedBox(height: 12.h),
                TransactionCard(transactions: data.incomes),
              ],
            ),
          );
        } else if (state is TransactionStateLoading) {
          return const Center(child: Loading());
        } else if (state is TransactionStateError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const SizedBox(); // initial
      },
    );
  }
}
