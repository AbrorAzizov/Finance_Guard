class CategoryEntity {
  final String id;
  final String name;
  final int iconCodePoint;
  final String? iconFontFamily;
  final int color;
  final bool isTracked;

  const CategoryEntity( {
    required this.isTracked,
    required this.id,
    required this.name,
    required this.iconCodePoint,
    this.iconFontFamily,
    required this.color,
  });
}
