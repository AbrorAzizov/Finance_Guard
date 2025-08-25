import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';

import '../domain/entity/category_summary.dart';

class GroupExpensesByName {
  List<CategorySummary> groupByName(List<TransactionEntity> expenses) {
    final Map<String, CategorySummary> map = {};

    for (final expense in expenses) {
      final name = expense.name;

      if (map.containsKey(name)) {
        final existing = map[name];
        map[name] = CategorySummary(
          name: name,
          amount: existing!.amount + expense.amount,
          categoryColor: existing.categoryColor,
          iconCodePoint: existing.iconCodePoint,
          iconFontFamily: existing.iconFontFamily,
        );
      } else {
        map[name] = CategorySummary(name: name,
            amount: expense.amount,
            iconCodePoint: expense.iconCodePoint,
            iconFontFamily: expense.iconFontFamily,
            categoryColor: expense.categoryColor);
      }
    }
    return map.values.toList();
  }
}
