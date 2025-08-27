class CategoryEntity {
  final String id;
  final String name;
  final int iconCodePoint;
  final String? iconFontFamily;
  final int color;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.iconCodePoint,
    this.iconFontFamily,
    required this.color,
  });
}
