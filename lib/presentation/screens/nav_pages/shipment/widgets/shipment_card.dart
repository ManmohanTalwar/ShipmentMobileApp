import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/widgets/dot.dart';
import 'package:moniepoint_task/presentation/widgets/status_container.dart';

class ShipmentCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const ShipmentCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(12.0),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 20.0,
            offset: const Offset(-4, 0),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StatusContainer(
                  status: data['status'],
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  data['delivery_details'] ?? '',
                  style: context.customStyle(
                    color: context.black(),
                    size: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  data['delivery_message'] ?? '',
                  style: context.customStyle(
                    color: context.subTitleColor(),
                    size: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Text(
                      data['charges'] ?? '',
                      style: context.customStyle(
                        color: context.primaryColor(),
                        size: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Dot(
                        color: context.greyTextColor(),
                      ),
                    ),
                    Text(
                      data['date'] ?? '',
                      style: context.customStyle(
                        color: context.black(),
                        size: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Image.asset(
              'assets/images/parcel.png',
              width: 80.0,
            ),
          )
        ],
      ),
    ).animate().fadeIn(duration: 250.ms).then().slideY(
          duration: 250.ms,
          begin: 0.5,
          end: 0,
        );
  }
}
