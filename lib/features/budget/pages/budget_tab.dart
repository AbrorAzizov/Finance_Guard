import 'package:finance_guard/core/dialog/loading_dialog.dart';
import 'package:finance_guard/core/widgets/add_button.dart';
import 'package:finance_guard/core/widgets/notifications_button.dart';
import 'package:finance_guard/features/budget/domain/repo/limits_repo_imp.dart';
import 'package:finance_guard/features/budget/pages/limits_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/text_styles.dart';
import '../../../servise_locator.dart';
import '../../home/bloc/transaction_bloc/transaction_cubit.dart';
import '../../home/bloc/transaction_bloc/transaction_state.dart';
import '../data/entity/limits_entity.dart';
import '../widgets/limit_widget.dart';

class BudgetTab extends StatefulWidget {
  const BudgetTab({super.key});

  @override
  State<BudgetTab> createState() => _BudgetTabState();
}

class _BudgetTabState extends State<BudgetTab> {
  late final Future<LimitsEntity> _limitsFuture;

  @override
  void initState() {
    super.initState();
    _limitsFuture = sl<LimitsRepo>().getLimits();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Budgets', style: AppTextStyles.screenTitle),
                NotificationsButton(onPressed: () {}),
              ],
            ),
            SizedBox(height: 30.h),
            Text('Limits', style: AppTextStyles.statsTitle),
            SizedBox(height: 12.h),

            /// оборачиваем в FutureBuilder
            FutureBuilder<LimitsEntity>(
              future: _limitsFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Loading());
                }

                final limits = snapshot.data!;
                return BlocBuilder<TransactionCubit, TransactionState>(
                  builder: (context, state) {
                    if (state is TransactionStateSummary) {
                      final monthExpenses = state.monthData.totalExpenses;
                      final weekExpenses = state.weekData.totalExpenses;

                      final monthPercentage = limits.monthlyLimit > 0
                          ? (monthExpenses / limits.monthlyLimit)
                              .clamp(0.0, 1.0)
                          : 0.0;

                      final weekLimit = limits.monthlyLimit / 4;
                      final weekPercentage = weekLimit > 0
                          ? (weekExpenses / weekLimit).clamp(0.0, 1.0)
                          : 0.0;

                      return Row(
                        children: [
                          Expanded(
                            child: LimitCard(
                              title: "Monthly",
                              expense: monthExpenses,
                              limit: limits.monthlyLimit,
                              value: monthPercentage,
                              onEdit: () async {
                                final updated = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const LimitsEditPage()),
                                );

                                if (updated == true) {
                                  setState(() {
                                    _limitsFuture = sl<LimitsRepo>().getLimits();
                                  });
                                }
                              },


                            ),
                          ),

                          SizedBox(width: 12.w),
                          Expanded(
                            child: LimitCard(
                              expense: weekExpenses,
                              limit: weekLimit,
                              title: "Weekly",
                              value: weekPercentage,
                              onEdit: () async {
                                final updated = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const LimitsEditPage()),
                                );

                                if (updated == true) {
                                  setState(() {
                                    _limitsFuture = sl<LimitsRepo>().getLimits();
                                  });
                                }
                              },

                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Loading());
                    }
                  },
                );
              },
            ),
          SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Goals', style: AppTextStyles.statsTitle),
                AddCircleButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  LimitsEditPage()),
                  );
                },)
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Regular Payments', style: AppTextStyles.statsTitle),
                AddCircleButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  LimitsEditPage()),
                  );
                },)
              ],
            ),
          ],
        ),
      ),
    );
  }


  }


