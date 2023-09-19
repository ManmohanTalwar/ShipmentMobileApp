import 'package:moniepoint_task/presentation/widgets/Shimmer/helpers/helpers.dart';
import 'package:moniepoint_task/presentation/widgets/Shimmer/values/value.dart';
import 'package:flutter/material.dart';

import 'line.dart';

class ItemShimmering extends StatelessWidget with FluttonShimmeringHelpers {
  ///
  /// @param countLine => each item, how many line you need
  /// @param widthLine => width rectangle
  /// @param heightLine => height rectangle
  /// @param radiusLine (optional) => radius for line
  /// @param lastWidthLine (optional) => width end line for each item
  ///
  ItemShimmering({
    Key? key,
    @required this.widthLine,
    @required this.heightLine,
    this.countLine = defaultCountLine,
    this.radiusLine,
    this.lastWidthLine,
  })  : _lastWidthLine = lastWidthLine == null ? widthLine : lastWidthLine,
        super(key: key);

  final double? radiusLine;
  final int? countLine;
  final double? widthLine;
  final double? heightLine;
  final double? lastWidthLine;
  final double? _lastWidthLine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          countLine!,
          (int index) => Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: LineShimmer(
              width: determineValueByComparasion<int, int>(
                      index, countLine! - 1)<double, double>(
                  widthLine, _lastWidthLine),
              height: heightLine!,
              radius: radiusLine!,
            ),
          ),
        ),
      ),
    );
  }
}
