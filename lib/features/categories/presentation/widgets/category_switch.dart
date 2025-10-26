
import 'package:flutter/material.dart';

import '../../data/entity/category_entity.dart';



class CategorySwitchTile extends StatefulWidget {
  final CategoryEntity category;
  final Future<void> Function(CategoryEntity category) onToggle;

  const CategorySwitchTile({
    super.key,
    required this.category,
    required this.onToggle,
  }) ;

  @override
  State<CategorySwitchTile> createState() => _CategorySwitchTileState();
}

class _CategorySwitchTileState extends State<CategorySwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.category.name),
      secondary: Icon(
        IconData(widget.category.iconCodePoint, fontFamily: widget.category.iconFontFamily),
        color: Color(widget.category.color),
      ),
      value: widget.category.isTracked,
      onChanged: (value) async {
        await widget.onToggle(widget.category); // вызывает switchState
      },
    );
  }
}
