import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/animated_list.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/home.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/neww.dart';
import 'package:moniepoint_task/presentation/screens/search/search_page.dart';
import 'package:moniepoint_task/presentation/widgets/custom_navigation_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

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
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = PersistentTabController(initialIndex: _currentIndex);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timerLink?.cancel();
    super.dispose();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: context.primaryColor(),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calculate),
        title: "Calculate",
        activeColorPrimary: context.primaryColor(),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.access_time),
        title: "Shipment",
        activeColorPrimary: context.primaryColor(),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: context.primaryColor(),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
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
          // bottomNavigationBar: CustomNavigationBar(
          //   bg: context.white(),
          //   current: _currentIndex,
          //   onPressed: onTabTapped,
          //   ec: context.primaryColor(),
          //   elemTags: const ['Home', 'Favourites', 'Messages', 'Profile'],
          //   icons: const [
          //     Icons.home,
          //     Icons.favorite,
          //     Icons.message,
          //     Icons.person_outline,
          //   ],
          // ),
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
              )
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .then()
                  .slide(duration: 450.ms),
              // Expanded(
              //   child: _children[_currentIndex],
              // ),
              Expanded(
                child: PersistentTabView(
                  context,
                  controller: _controller,
                  screens: _children,
                  items: _navBarsItems(),
                  confineInSafeArea: true,
                  backgroundColor: Colors.white, // Default is Colors.white.
                  handleAndroidBackButtonPress: true, // Default is true.
                  resizeToAvoidBottomInset:
                      true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                  stateManagement: true, // Default is true.
                  hideNavigationBarWhenKeyboardShows:
                      true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                  decoration: NavBarDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    colorBehindNavBar: Colors.white,
                  ),
                  popAllScreensOnTapOfSelectedTab: true,
                  popActionScreens: PopActionScreensType.all,
                  itemAnimationProperties: const ItemAnimationProperties(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.ease,
                  ),
                  screenTransitionAnimation: const ScreenTransitionAnimation(
                    animateTabTransition: true,
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 200),
                  ),
                  navBarStyle: NavBarStyle
                      .style3, // Choose the nav bar style with this property.
                ),
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
