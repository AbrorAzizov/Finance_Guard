import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/core/widgets/create_button.dart';
import 'package:finance_guard/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../servise_locator.dart';
import '../repo/balance_repo.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final balanceRepo = sl<BalanceRepo>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Центрируем всё
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              Text(
                'Enter main account balance',
                style: AppTextStyles.accountBalance,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.h),
              Text(
                'you can add more accounts in the Accounts section',
                style: AppTextStyles.widgetLabel,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.w),
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter amount', style: AppTextStyles.widgetLabel),
                    TextField(
                      controller: controller,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        prefixStyle: TextStyle(color: Colors.white, fontSize: 40.h),
                        hintText: '|...',
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CreateButton(onPressed: () {
                final text  = controller.text;
                if(text.isNotEmpty){
                  final amount = double.tryParse(text) ?? 0;
                  debugPrint(' saved $amount');
                  balanceRepo.saveTotal(amount);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );

  }
}
