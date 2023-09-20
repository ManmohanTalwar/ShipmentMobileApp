import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/helper/Helper.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/widgets/information_card.dart';

class TrackingCard extends StatelessWidget {
  final AnimationController controller;
  const TrackingCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tracking',
            style: context.customStyle(
              color: context.black(),
              size: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12.0),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16.0),
                topLeft: Radius.circular(16.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 20.0,
                  offset: const Offset(-4, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipment Number',
                          style: context.customFont(
                            color: darkGreyColor,
                            size: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          'NEJ20089435352253',
                          style: context.customStyle(
                            color: context.black(),
                            size: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/forklift.jpeg',
                      width: 50.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Helper.divider(
                  right: 0.0,
                  left: 0.0,
                  color: context.dividerColor(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InformationCard(
                      title: 'Sender',
                      value: 'Atlanta , CS30',
                      image: 'assets/svg/icons/parcel_out.svg',
                      isSender: true,
                    ),
                    InformationCard(
                      title: 'Time',
                      value: '2 day -3 days      ',
                      image: 'assets/svg/icons/parcel_out.svg',
                      showImage: false,
                      showDot: true,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InformationCard(
                      title: 'Receiver',
                      value: 'Chicago , 6342',
                      image: 'assets/svg/icons/parcel_in.svg',
                    ),
                    InformationCard(
                      title: 'Status',
                      value: 'waiting to collect',
                      image: 'assets/svg/icons/parcel_out.svg',
                      showImage: false,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1.0,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      enableFeedback: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                      )),
                  child: Text(
                    '+ Add Stop',
                    style: context.customStyle(
                      color: context.accentColor(),
                      size: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )
        .animate(controller: controller)
        .fadeIn(duration: 250.ms)
        .then()
        .slideY(begin: 1, end: 0, duration: 350.ms);
  }
}
