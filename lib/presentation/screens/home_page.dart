import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/widgets/custom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage>, WidgetsBindingObserver {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Home(),
    const AnimatedListScreen(),
    const New(),
    const Home(),
  ];
  String itemId = '';

  Timer? _timerLink;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timerLink?.cancel();
    super.dispose();
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // store = Provider.of<AppStore>(context);
    return WillPopScope(
      onWillPop: () => UIHelper.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppConstants.white,
          bottomNavigationBar: CustomNavigationBar(
            bg: context.white(),
            current: _currentIndex,
            onPressed: onTabTapped,
            ec: context.primaryColor(),
            elemTags: const ['Home', 'Favourites', 'Messages', 'Profile'],
            icons: const [
              Icons.home,
              Icons.favorite,
              Icons.message,
              Icons.person_outline,
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
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
                              backgroundImage: AssetImage(
                                  'assets/images/profile_picture.png'),
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
                                      color: Colors.grey,
                                      height: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      'Your Location',
                                      style: context.customStyle(
                                        color: Colors.grey,
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
                    Hero(
                      tag: 'Search-Container',
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        height: 48.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Icon(
                                  Icons.search,
                                  color: context.primaryColor(),
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  'Enter the receipt number ...',
                                  style: context.customStyle(
                                    color: Colors.grey,
                                    size: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: context.accentColor(),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.qr_code_scanner_rounded,
                                size: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .then()
                  .slide(duration: 450.ms),
              Expanded(
                child: _children[_currentIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
