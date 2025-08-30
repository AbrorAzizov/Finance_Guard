import 'package:finance_guard/features/categories/data/category_entity.dart';
import 'package:finance_guard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/widgets/comment_section.dart';
import '../../../../core/widgets/create_button.dart';
import '../../../../core/widgets/date_picker.dart';
import '../../../../core/widgets/enter_amount.dart';
import '../../../../core/widgets/selecting_category.dart';

import '../../../categories/presentation/bloc/category_state.dart';
import '../../bloc/transaction_bloc/transaction_cubit.dart';
import '../../domain/entity/initial_transaction.dart';

class ExpenseTab extends StatefulWidget {
  const ExpenseTab({super.key});

  @override
  State<ExpenseTab> createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  DateTime selectedTime = DateTime.now();
  double moneyAmount = 0;
  String? comment;
  final _uuid = Uuid();

  CategoryEntity? selectedCategory;

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().loadCategories();
  }

  Future<void> _createTransaction() async {
    if (moneyAmount == 0 || selectedCategory == null) return;

    final transaction = InitialTransactionEntity(
      id: _uuid.v4(),
      comment: comment,
      categoryId: selectedCategory!.id,
      amount: moneyAmount,
      date: selectedTime,
      type: 'expense',

    );

    context.read<TransactionCubit>().createTransaction(transaction, selectedCategory!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          final categories = state.categories;

          return SingleChildScrollView(
            child: Column(
              children: [
                CurrencyInput(
                  selectedAmount: (value) {
                    final cleaned = value.replaceAll(RegExp(r'[^0-9.]'), '');
                    setState(() {
                      moneyAmount = double.tryParse(cleaned) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                CommentInput(
                  onCommentChanged: (text) {
                    setState(() {
                      comment = text;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                CreateButton(
                  onPressed: _createTransaction,
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
