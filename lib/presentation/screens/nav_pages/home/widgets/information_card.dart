import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/widgets/dot.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String value;
  final String image;
  final bool showImage;
  final bool isSender;
  final bool showDot;
  const InformationCard({
    Key? key,
    this.showImage = true,
    this.isSender = false,
    this.showDot = false,
    required this.title,
    required this.image,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showImage) ...{
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSender
                  ? context.accentColor().withOpacity(0.2)
                  : context.tealColor(),
            ),
            child: SvgPicture.asset(
              image,
              width: 25.0,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        },
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: context.customFont(
                color: darkGreyColor,
                size: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                if (showDot) ...{
                  Dot(
                    color: context.greenColor(),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                },
                Text(
                  value,
                  style: context.customStyle(
                    color: context.black(),
                    size: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
