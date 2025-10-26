import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/features/categories/data/entity/icon_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class SelectingIcon extends StatelessWidget {
  final IconEntity? selectedIcon;
  final ValueChanged<IconEntity> onSelect;

  const SelectingIcon({
    super.key,
    required this.selectedIcon,
    required this.onSelect,
  });

  int colorToInt(Color color) {
    final int a = color.a.toInt();
    final int r = color.r.toInt();
    final int g = color.g.toInt();
    final int b = color.b.toInt();
    return (a << 24) | (r << 16) | (g << 8) | b;
  }

  @override
  Widget build(BuildContext context) {
    final List<IconEntity> iconEntities = [
      IconEntity(
        id: 'travel',
        iconCodePoint: Icons.flight_takeoff.codePoint,
        iconFontFamily: Icons.flight_takeoff.fontFamily,
        color: colorToInt(Colors.blue),
      ),
      IconEntity(
        id: 'health',
        iconCodePoint: Icons.local_hospital.codePoint,
        iconFontFamily: Icons.local_hospital.fontFamily,
        color: colorToInt(Colors.redAccent),
      ),
      IconEntity(
        id: 'gift',
        iconCodePoint: Icons.card_giftcard.codePoint,
        iconFontFamily: Icons.card_giftcard.fontFamily,
        color: colorToInt(Colors.pink),
      ),
      IconEntity(
        id: 'pets',
        iconCodePoint: Icons.pets.codePoint,
        iconFontFamily: Icons.pets.fontFamily,
        color: colorToInt(Colors.brown),
      ),
      IconEntity(
        id: 'education',
        iconCodePoint: Icons.school.codePoint,
        iconFontFamily: Icons.school.fontFamily,
        color: colorToInt(Colors.cyan),
      ),
      IconEntity(
        id: 'bills',
        iconCodePoint: Icons.receipt_long.codePoint,
        iconFontFamily: Icons.receipt_long.fontFamily,
        color: colorToInt(Colors.orangeAccent),
      ),
      IconEntity(
        id: 'savings',
        iconCodePoint: Icons.savings.codePoint,
        iconFontFamily: Icons.savings.fontFamily,
        color: colorToInt(Colors.greenAccent),
      ),
      IconEntity(
        id: 'technology',
        iconCodePoint: Icons.devices.codePoint,
        iconFontFamily: Icons.devices.fontFamily,
        color: colorToInt(Colors.blueGrey),
      ),
      IconEntity(
        id: 'fitness',
        iconCodePoint: Icons.fitness_center.codePoint,
        iconFontFamily: Icons.fitness_center.fontFamily,
        color: colorToInt(Colors.deepOrange),
      ),
      IconEntity(
        id: 'beauty',
        iconCodePoint: Icons.brush.codePoint,
        iconFontFamily: Icons.brush.fontFamily,
        color: colorToInt(Colors.purpleAccent),
      ),
      IconEntity(
        id: 'communication',
        iconCodePoint: Icons.phone_android.codePoint,
        iconFontFamily: Icons.phone_android.fontFamily,
        color: colorToInt(Colors.lightBlue),
      ),
      IconEntity(
        id: 'food',
        iconCodePoint: Icons.restaurant.codePoint,
        iconFontFamily: Icons.restaurant.fontFamily,
        color: colorToInt(Colors.orange),
      ),
      IconEntity(
        id: 'drink',
        iconCodePoint: Icons.local_drink.codePoint,
        iconFontFamily: Icons.local_drink.fontFamily,
        color: colorToInt(Colors.red),
      ),
      IconEntity(
        id: 'rent',
        iconCodePoint: Icons.home_work_outlined.codePoint,
        iconFontFamily: Icons.home_work_outlined.fontFamily,
        color: colorToInt(Colors.purple),
      ),
      IconEntity(
        id: 'car',
        iconCodePoint: Icons.directions_car.codePoint,
        iconFontFamily: Icons.directions_car.fontFamily,
        color: colorToInt(Colors.indigo),
      ),
      IconEntity(
        id: 'shopping',
        iconCodePoint: Icons.shopping_cart.codePoint,
        iconFontFamily: Icons.shopping_cart.fontFamily,
        color: colorToInt(Colors.teal),
      ),
      IconEntity(
        id: 'salary',
        iconCodePoint: Icons.attach_money.codePoint,
        iconFontFamily: Icons.attach_money.fontFamily,
        color: colorToInt(Colors.green),
      ),
      IconEntity(
        id: 'entertainment',
        iconCodePoint: Icons.movie.codePoint,
        iconFontFamily: Icons.movie.fontFamily,
        color: colorToInt(Colors.deepPurple),
      ),
      IconEntity(
        id: 'transport',
        iconCodePoint: Icons.train.codePoint,
        iconFontFamily: Icons.train.fontFamily,
        color: colorToInt(Colors.indigoAccent),
      ),
      IconEntity(
        id: 'insurance',
        iconCodePoint: Icons.security.codePoint,
        iconFontFamily: Icons.security.fontFamily,
        color: colorToInt(Colors.tealAccent),
      ),
      IconEntity(
        id: 'kids',
        iconCodePoint: Icons.toys.codePoint,
        iconFontFamily: Icons.toys.fontFamily,
        color: colorToInt(Colors.yellow),
      ),
      IconEntity(
        id: 'music',
        iconCodePoint: Icons.music_note.codePoint,
        iconFontFamily: Icons.music_note.fontFamily,
        color: colorToInt(Colors.pinkAccent),
      ),
      IconEntity(
        id: 'groceries',
        iconCodePoint: Icons.local_grocery_store.codePoint,
        iconFontFamily: Icons.local_grocery_store.fontFamily,
        color: colorToInt(Colors.lime),
      ),
      IconEntity(
        id: 'party',
        iconCodePoint: Icons.celebration.codePoint,
        iconFontFamily: Icons.celebration.fontFamily,
        color: colorToInt(Colors.deepPurpleAccent),
      ),
      IconEntity(
        id: 'charity',
        iconCodePoint: Icons.volunteer_activism.codePoint,
        iconFontFamily: Icons.volunteer_activism.fontFamily,
        color: colorToInt(Colors.red),
      ),
      IconEntity(
        id: 'taxes',
        iconCodePoint: Icons.account_balance.codePoint,
        iconFontFamily: Icons.account_balance.fontFamily,
        color: colorToInt(Colors.blueAccent),
      ),
      IconEntity(
        id: 'other',
        iconCodePoint: Icons.more_horiz.codePoint,
        iconFontFamily: Icons.more_horiz.fontFamily,
        color: colorToInt(Colors.grey),
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Icon', style: AppTextStyles.widgetLabel),
          SizedBox(height: 8.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: iconEntities.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              final category = iconEntities[index];
              final isSelected = selectedIcon?.id == category.id;

              return GestureDetector(
                onTap: () => onSelect(category),
                child: Container(
                  width: 60.h,
                  height: 60.h,
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(width: 4, color: AppColors.primary)
                        : null,
                    shape: BoxShape.circle,
                    color: Color(category.color),
                  ),
                  child: Center(
                    child: Icon(
                      IconData(
                        category.iconCodePoint,
                        fontFamily: category.iconFontFamily,
                      ),
                      size: 28.h,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
