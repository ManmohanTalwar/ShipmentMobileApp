import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/helper/Helper.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/widgets/information_card.dart';
import 'package:moniepoint_task/presentation/widgets/entry_field.dart';
import 'package:moniepoint_task/presentation/widgets/normal_dropdown.dart';
import 'package:moniepoint_task/presentation/widgets/prefix_icon_widget.dart';

class PackagingWrapper extends StatefulWidget {
  final AnimationController controller;
  const PackagingWrapper({
    super.key,
    required this.controller,
  });

  @override
  State<PackagingWrapper> createState() => _PackagingWrapperState();
}

class _PackagingWrapperState extends State<PackagingWrapper> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
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
          NormalDropDown(
            text: 'Box',
            showIcon: true,
            isFromListing: true,
            onTap: () {},
          ),
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
