import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/back_button.dart';
import '../../../core/widgets/custom_tab_bar.dart';

import '../view/expense_history_view.dart';
import '../view/income_history_view.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArrowBackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 30.h),
                Text('Transaction history', style: AppTextStyles.screenTitle),
                SizedBox(height: 30.h),

                // --- Tabs ---
                Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: AppColors.cardBackground,
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    tabs: const [
                      TabItem(title: 'Expense'),
                      TabItem(title: 'Income'),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),

                // --- Tab content ---
                Expanded(
                  child: TabBarView(
                    children: [
                      ExpenseHistoryView(),
                      IncomeHistoryView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
