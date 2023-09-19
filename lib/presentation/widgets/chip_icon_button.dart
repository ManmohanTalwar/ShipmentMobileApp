import 'package:flutter/material.dart';
import 'package:moniepoint_task/main.dart';

class ChipIconButton extends StatelessWidget {
  final IconData? icon;
  final double size;
  final GestureTapCallback? onTap;
  final String? text;

  const ChipIconButton(
      {Key? key, this.icon, this.size = 24.0, this.onTap, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: text == null ? 48.0 : 90.0,
        height: 48.0,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.06),
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: text == null
            ? Icon(
                icon,
                color: context.black(),
                size: size,
              )
            : Text(
                text!,
                style: context.customStyle(
                  fontWeight: FontWeight.w500,
                  size: 15.0,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
