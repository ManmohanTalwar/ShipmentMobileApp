import 'package:flutter/material.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/main.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    this.isSelected = false,
    required this.category,
    required this.onTap,
  });

  final bool isSelected;
  final String category;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        padding: EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: isSelected ? 18.0 : 12.0,
        ),
        decoration: BoxDecoration(
          color: isSelected ? selectedCategoryColor : Colors.white,
          border: Border.all(
            color: selectedCategoryColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: context.customStyle(
            size: 15.0,
            color: isSelected ? context.white() : context.black(),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
