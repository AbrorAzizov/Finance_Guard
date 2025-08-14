import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/core/widgets/back_button.dart';
import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';
import 'package:finance_guard/features/home/domain/repository/transaction_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/comment_section.dart';
import '../../../core/widgets/create_button.dart';
import '../../../core/widgets/custom_tab_bar.dart';
import '../../../core/widgets/date_picker.dart';
import '../../../core/widgets/enter_amount.dart';
import '../../../core/widgets/selecting_category.dart';
import '../../../servise_locator.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final transactionRepository = sl<TransactionRepository>();

  final categories = const [
    Category(name: 'Food', icon: Icons.restaurant, color: Colors.orange),
    Category(name: 'Drink', icon: Icons.local_drink, color: Colors.red),
    Category(name: 'Rent', icon: Icons.home_work_outlined, color: Colors.purple),
    Category(name: 'Car', icon: Icons.directions_car, color: Colors.indigo),
  ];
  late Category selectedCategory = categories[0];
  late DateTime selectedTime;
  double moneyAmount = 0;
  String? comment;
  final _uuid = Uuid();

  Future<void> _createTransaction() async {
    if (moneyAmount == 0) {
      return;
    }
    final transaction = TransactionEntity(
        id: _uuid.v4(),
        comment: comment,
        amount: moneyAmount,
        iconCodePoint: selectedCategory.icon.codePoint,
        iconFontFamily: selectedCategory.icon.fontFamily,
        categoryColor: selectedCategory.color.value,
        date: selectedTime,
        type: DefaultTabController.of(context).index == 0 ? 'expense' : 'income',);
    try{
      await transactionRepository.addTransaction(transaction);
      final response = await transactionRepository.getAllTransaction();
      print('hi');
    }catch (e){
      print(e);
    }


  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CurrencyInput(
                          selectedAmount: (value) {
                            setState(() {
                              moneyAmount = double.tryParse(value) ?? 0;
                              print(moneyAmount);
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SelectingCategory(
                          selectedCategory: selectedCategory,
                          onSelect: (category) {
                            setState(() {
                              debugPrint('Выбрана категория: ${category.name}');
                              selectedCategory = category;
                            });
                          },
                          categories: categories,
                        ),
                        SizedBox(height: 20.h),
                        DatePicker(
                          onDateSelected: (value) {
                            setState(() {
                              selectedTime = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommentInput(
                          onCommentChanged: (text) {
                            comment = text;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CreateButton(
                          onPressed: () {
                            _createTransaction();
                          },
                        )
                      ],
                    ),
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
