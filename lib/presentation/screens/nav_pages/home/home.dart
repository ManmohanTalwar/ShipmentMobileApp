import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_task/helper/Helper.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/search/search_page.dart';
import 'package:moniepoint_task/presentation/widgets/custom_app_bar.dart';
import 'package:moniepoint_task/store/app_store.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AppStore appStore;
  List<Widget> trackerList = [];
  @override
  Widget build(BuildContext context) {
    appStore = context.watch<AppStore>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              const AnimatedAppBar(),
              UIHelper.verticalSpace(10.0),
              const TrackingCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class TrackingCard extends StatelessWidget {
  const TrackingCard({
    super.key,
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
        .animate()
        .fadeIn(duration: 250.ms)
        .then()
        .slideY(begin: 1, end: 0, duration: 350.ms);
  }
}

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
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.greenColor(),
                    ),
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

class AnimatedAppBar extends StatelessWidget {
  const AnimatedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      color: context.primaryColor(),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22.0,
                    backgroundImage:
                        AssetImage('assets/images/profile_picture.png'),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/icons/navigation.svg',
                            color: context.greyTextColor(),
                            height: 14.0,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            'Your Location',
                            style: context.customStyle(
                              color: context.greyTextColor(),
                              size: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Wertheimer, Illinois',
                            style: context.customStyle(
                              color: Colors.white,
                              size: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.notifications_none),
              )
            ],
          ),
          const SizedBox(
            height: 14.0,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            child: Hero(
              tag: 'Search-Container',
              flightShuttleBuilder:
                  (c, ani, direction, fromContext, toContext) {
                switch (direction) {
                  case HeroFlightDirection.push:
                    return ScaleTransition(
                      scale: ani.drive(
                        Tween(
                          begin: 0.5,
                          end: 1.0,
                        ).chain(
                          CurveTween(curve: Curves.fastOutSlowIn),
                        ),
                      ),
                      child: fromContext.widget,
                    );
                  case HeroFlightDirection.pop:
                    return toContext.widget;
                }
              },
              child: const SearchContainer(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).then().slide(duration: 450.ms);
  }
}
