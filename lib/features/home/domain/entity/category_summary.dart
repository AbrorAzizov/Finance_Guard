
class CategorySummary {
  final String name;
  final double amount;
  final int iconCodePoint;
  final String? iconFontFamily;
  final int categoryColor;
  final bool isTracked;

  CategorySummary({
    required this.isTracked,
    required this.name,
    required this.amount,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.categoryColor,
  });
}