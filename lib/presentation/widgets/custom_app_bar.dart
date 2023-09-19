import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget leading;
  final Widget action;
  const CustomAppBar({
    Key? key,
    this.title,
    required this.leading,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: context.primaryColor(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          title != null
              ? Text(
                  title!,
                  style: context.customStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    size: 16.0,
                  ),
                )
              : Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/icons/location_icon.svg',
                      color: context.primaryColor(),
                      width: 20.0,
                      height: 20.0,
                    ),
                    UIHelper.horizontalSpace(6.0),
                    Text(
                      'California, US',
                      style: context.customStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        size: 16.0,
                      ),
                    ),
                    UIHelper.horizontalSpace(2.0),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: context.primaryColor(),
                    )
                  ],
                ),
          action,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 76.0);
}
