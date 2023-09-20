import 'package:flutter/material.dart';
import 'package:moniepoint_task/main.dart';

class TabChild extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  const TabChild({
    Key? key,
    required this.count,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: context.customStyle(
            color:
                isSelected ? context.white() : context.white().withOpacity(0.6),
            size: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          width: 6.0,
        ),
        CountWrapper(
          count: count,
          isSelected: isSelected,
        )
      ],
    );
  }
}

class CountWrapper extends StatelessWidget {
  final int count;
  final bool isSelected;
  const CountWrapper({
    Key? key,
    required this.count,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 1.0,
      ),
      decoration: BoxDecoration(
        color: isSelected ? context.accentColor() : context.primaryColorLight(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        '$count',
        style: context.customStyle(
          color:
              isSelected ? context.white() : context.white().withOpacity(0.6),
          size: 12.0,
        ),
      ),
    );
  }
}
