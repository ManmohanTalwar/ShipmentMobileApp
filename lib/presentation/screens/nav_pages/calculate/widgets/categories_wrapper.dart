import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/helper/Helper.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/calculate/widgets/category_card.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/widgets/information_card.dart';
import 'package:moniepoint_task/presentation/widgets/entry_field.dart';
import 'package:moniepoint_task/presentation/widgets/prefix_icon_widget.dart';

class CategoriesWrapper extends StatefulWidget {
  final AnimationController controller;
  const CategoriesWrapper({
    super.key,
    required this.controller,
  });

  @override
  State<CategoriesWrapper> createState() => _CategoriesWrapperState();
}

class _CategoriesWrapperState extends State<CategoriesWrapper> {
  List<String> categories = [
    'Documents',
    'Glass',
    'Liquid',
    'Food',
    'Electronics',
    'Cloth',
    'Groceries',
    'Product',
    'Others',
  ];

  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.bounceInOut,
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Packaging',
            style: context.customStyle(
              color: context.black(),
              size: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'What are you sending?',
            style: context.customStyle(
              color: context.darkTextColor(),
              size: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: [
              ...categories
                  .map(
                    (e) => CategoryCard(
                      category: e,
                      isSelected: selectedCategory == e,
                      onTap: () {
                        setState(() {
                          selectedCategory = e;
                        });
                      },
                    ),
                  )
                  .toList(),
            ],
          )
        ],
      ),
    )
        .animate(controller: widget.controller)
        .fadeIn(duration: 250.ms)
        .then()
        .slideY(
          begin: 0.2,
          end: 0,
          duration: 350.ms,
        );
  }
}
