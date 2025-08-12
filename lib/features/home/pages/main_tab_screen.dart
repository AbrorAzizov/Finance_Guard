import 'package:finance_guard/core/constants/app_colors.dart';
import 'package:finance_guard/features/home/pages/transaction_page.dart';
import 'package:finance_guard/features/home/view/day_statistics.dart';
import 'package:finance_guard/features/home/view/month_statistics.dart';
import 'package:finance_guard/features/home/view/week_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/add_button.dart';
import '../../../core/widgets/custom_tab_bar.dart';
import '../../../core/widgets/notifications_button.dart';


class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(17.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // Заголовок + кнопки
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Main', style: AppTextStyles.screenTitle),
                  Row(
                    children: [
                      AddCircleButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const TransactionPage()),
                          );
                        },
                      ),
                      SizedBox(width: 8.w),
                      NotificationsButton(onPressed: () {}),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              // TabBar
              Container(
                height: 40.h,
                width: MediaQuery.of(context).size.width * 0.75 ,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                    TabItem(title: 'Day'),
                    TabItem(title: 'Week'),
                    TabItem(title: 'Month'),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Контент вкладок
              const Expanded(
                child: TabBarView(
                  children: [
                    DayStatistics(),
                    WeekStatistics(),
                    MonthStatistics(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}