import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/main.dart';

class AvailableVehicles extends StatefulWidget {
  final AnimationController controller;
  const AvailableVehicles({
    super.key,
    required this.controller,
  });

  @override
  State<AvailableVehicles> createState() => _AvailableVehiclesState();
}

class _AvailableVehiclesState extends State<AvailableVehicles> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<Map<String, dynamic>> vehicles = [
    {
      'transport_means': 'Ocean Freight',
      'route_source': 'International',
      'image': 'assets/images/ocean_freight.png',
    },
    {
      'transport_means': 'Cargo Freight',
      'route_source': 'Reliable',
      'image': 'assets/images/cargo_freight.png',
    },
    {
      'transport_means': 'Air Freight',
      'route_source': 'International',
      'image': 'assets/images/air_freight.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
      ),
      height: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available vehicles',
            style: context.customStyle(
              color: context.black(),
              size: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: AnimatedList(
              key: listKey,
              initialItemCount: vehicles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index, animation) {
                final data = vehicles[index];
                return Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(12.0),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.05),
                            spreadRadius: 5,
                            blurRadius: 50.0,
                            offset: const Offset(-4, 0),
                          ),
                        ],
                      ),
                      height: 200.0,
                      width: 160.0,
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['transport_means'],
                            style: context.customStyle(
                              color: context.black(),
                              size: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            data['route_source'],
                            style: context.customFont(
                              color: darkGreyColor,
                              size: 13.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedPositioned(
                      right: 20.0,
                      bottom: 70.0,
                      duration: const Duration(milliseconds: 250),
                      child: Image.asset(
                        data['image'],
                        width: 100.0,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    )
        .animate(controller: widget.controller)
        .fadeIn(duration: 250.ms)
        .then()
        .slideX(begin: 1, end: 0, duration: 350.ms);
  }
}
