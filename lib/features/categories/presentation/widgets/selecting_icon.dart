import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/features/categories/data/entity/icon_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/entity/category_entity.dart';

class SelectingIcon extends StatelessWidget {
  final IconEntity? selectedIcon;
  final ValueChanged<IconEntity> onSelect;

  const SelectingIcon({
    super.key,
    required this.selectedIcon,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final List<IconEntity> iconEntities = [
      // ✅ старые трогать не будем, только новые
      IconEntity(
        id: 'travel',
        iconCodePoint: Icons.flight_takeoff.codePoint,
        iconFontFamily: Icons.flight_takeoff.fontFamily,
        color: Colors.blue.value,
      ),
      IconEntity(
        id: 'health',
        iconCodePoint: Icons.local_hospital.codePoint,
        iconFontFamily: Icons.local_hospital.fontFamily,
        color: Colors.redAccent.value,
      ),
      IconEntity(
        id: 'gift',
        iconCodePoint: Icons.card_giftcard.codePoint,
        iconFontFamily: Icons.card_giftcard.fontFamily,
        color: Colors.pink.value,
      ),
      IconEntity(
        id: 'pets',
        iconCodePoint: Icons.pets.codePoint,
        iconFontFamily: Icons.pets.fontFamily,
        color: Colors.brown.value,
      ),
      IconEntity(
        id: 'education',
        iconCodePoint: Icons.school.codePoint,
        iconFontFamily: Icons.school.fontFamily,
        color: Colors.cyan.value,
      ),
      IconEntity(
        id: 'bills',
        iconCodePoint: Icons.receipt_long.codePoint,
        iconFontFamily: Icons.receipt_long.fontFamily,
        color: Colors.orangeAccent.value,
      ),
      IconEntity(
        id: 'savings',
        iconCodePoint: Icons.savings.codePoint,
        iconFontFamily: Icons.savings.fontFamily,
        color: Colors.greenAccent.value,
      ),
      IconEntity(
        id: 'technology',
        iconCodePoint: Icons.devices.codePoint,
        iconFontFamily: Icons.devices.fontFamily,
        color: Colors.blueGrey.value,
      ),
      IconEntity(
        id: 'fitness',
        iconCodePoint: Icons.fitness_center.codePoint,
        iconFontFamily: Icons.fitness_center.fontFamily,
        color: Colors.deepOrange.value,
      ),
      IconEntity(
        id: 'beauty',
        iconCodePoint: Icons.brush.codePoint,
        iconFontFamily: Icons.brush.fontFamily,
        color: Colors.purpleAccent.value,
      ),
      IconEntity(
        id: 'communication',
        iconCodePoint: Icons.phone_android.codePoint,
        iconFontFamily: Icons.phone_android.fontFamily,
        color: Colors.lightBlue.value,
      ),
      IconEntity(
        id: 'food',
        iconCodePoint: Icons.restaurant.codePoint,
        iconFontFamily: Icons.restaurant.fontFamily,
        color: Colors.orange.value,
      ),
      IconEntity(
        id: 'drink',
        iconCodePoint: Icons.local_drink.codePoint,
        iconFontFamily: Icons.local_drink.fontFamily,
        color: Colors.red.value,
      ),
      IconEntity(
        id: 'rent',
        iconCodePoint: Icons.home_work_outlined.codePoint,
        iconFontFamily: Icons.home_work_outlined.fontFamily,
        color: Colors.purple.value,
      ),
      IconEntity(
        id: 'car',
        iconCodePoint: Icons.directions_car.codePoint,
        iconFontFamily: Icons.directions_car.fontFamily,
        color: Colors.indigo.value,
      ),
      IconEntity(
        id: 'shopping',
        iconCodePoint: Icons.shopping_cart.codePoint,
        iconFontFamily: Icons.shopping_cart.fontFamily,
        color: Colors.teal.value,
      ),
      IconEntity(
        id: 'salary',
        iconCodePoint: Icons.attach_money.codePoint,
        iconFontFamily: Icons.attach_money.fontFamily,
        color: Colors.green.value,
      ),
      IconEntity(
        id: 'entertainment',
        iconCodePoint: Icons.movie.codePoint,
        iconFontFamily: Icons.movie.fontFamily,
        color: Colors.deepPurple.value,
      ),
      IconEntity(
        id: 'transport',
        iconCodePoint: Icons.train.codePoint,
        iconFontFamily: Icons.train.fontFamily,
        color: Colors.indigoAccent.value,
      ),
      IconEntity(
        id: 'insurance',
        iconCodePoint: Icons.security.codePoint,
        iconFontFamily: Icons.security.fontFamily,
        color: Colors.tealAccent.value,
      ),
      IconEntity(
        id: 'kids',
        iconCodePoint: Icons.toys.codePoint,
        iconFontFamily: Icons.toys.fontFamily,
        color: Colors.yellow.value,
      ),
      IconEntity(
        id: 'music',
        iconCodePoint: Icons.music_note.codePoint,
        iconFontFamily: Icons.music_note.fontFamily,
        color: Colors.pinkAccent.value,
      ),
      IconEntity(
        id: 'groceries',
        iconCodePoint: Icons.local_grocery_store.codePoint,
        iconFontFamily: Icons.local_grocery_store.fontFamily,
        color: Colors.lime.value,
      ),
      IconEntity(
        id: 'party',
        iconCodePoint: Icons.celebration.codePoint,
        iconFontFamily: Icons.celebration.fontFamily,
        color: Colors.deepPurpleAccent.value,
      ),
      IconEntity(
        id: 'charity',
        iconCodePoint: Icons.volunteer_activism.codePoint,
        iconFontFamily: Icons.volunteer_activism.fontFamily,
        color: Colors.red.value,
      ),
      IconEntity(
        id: 'taxes',
        iconCodePoint: Icons.account_balance.codePoint,
        iconFontFamily: Icons.account_balance.fontFamily,
        color: Colors.blueAccent.value,
      ),
      IconEntity(
        id: 'other',
        iconCodePoint: Icons.more_horiz.codePoint,
        iconFontFamily: Icons.more_horiz.fontFamily,
        color: Colors.grey.value,
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
              print(iconEntities.length);
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
                  ));
            },
          ),
        ],
      ),
    );
  }
}
