
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/widgets/comment_section.dart';
import '../../../../core/widgets/create_button.dart';
import '../../../../core/widgets/date_picker.dart';
import '../../../../core/widgets/enter_amount.dart';
import '../../../../core/widgets/selecting_category.dart';
import '../../bloc/transaction_bloc/transaction_cubit.dart';
import '../../domain/entity/transaction_entity.dart';

class ExpenseTab extends StatefulWidget {
  const ExpenseTab({super.key});

  @override
  State<ExpenseTab> createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  final categories = const [
    Category(name: 'Food', icon: Icons.restaurant, color: Colors.orange),
    Category(name: 'Drink', icon: Icons.local_drink, color: Colors.red),
    Category(name: 'Rent', icon: Icons.home_work_outlined, color: Colors.purple),
    Category(name: 'Car', icon: Icons.directions_car, color: Colors.indigo),
  ];
  late Category selectedCategory = categories[0];
  DateTime selectedTime = DateTime.now();
  double moneyAmount = 0;
  String? comment;
  final _uuid = Uuid();

  Future<void> _createTransaction() async {
    print('method called                   тттт');
    if (moneyAmount == 0) {
      return;
    }
    final transaction = TransactionEntity(
      id: _uuid.v4(),
      comment: comment,
      name: selectedCategory.name,
      amount: moneyAmount,
      iconCodePoint: selectedCategory.icon.codePoint,
      iconFontFamily: selectedCategory.icon.fontFamily,
      categoryColor: selectedCategory.color.value,
      date: selectedTime,
      type: 'expense' ,);

    context.read<TransactionCubit>().createTransaction(transaction);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CurrencyInput(
            selectedAmount: (value) {
              final cleaned = value.replaceAll(RegExp(r'[^0-9.]'), '');
              setState(() {
                moneyAmount = double.tryParse(cleaned) ?? 0;
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
              setState(() {
                comment = text;
              });
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CreateButton(
            onPressed: _createTransaction,
          ),
        ],
      ),
    );
  }
}
