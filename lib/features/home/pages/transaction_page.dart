import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/core/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_tab_bar.dart';
import '../../../core/widgets/enter_amount.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ArrowBackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Text('Add Transaction', style: AppTextStyles.screenTitle),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.55 ,
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
            SizedBox(height: 25.h),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      CurrencyInput(),
                    ],
                  ),
                  Text('inc'),
                ],
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
