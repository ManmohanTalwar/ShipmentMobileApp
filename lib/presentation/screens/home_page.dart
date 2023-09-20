import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/calculate/calculate_charges.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/home.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/shipment/shipment_history.dart';
import 'package:moniepoint_task/store/app_store.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage>, WidgetsBindingObserver {
  final List<Widget> _children = [
    const Home(),
    const CalculateCharges(),
    const ShipmentHistory(),
    const Home(),
  ];
  String itemId = '';

  Timer? _timerLink;

  late AppStore store;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    store = context.watch<AppStore>();
    return WillPopScope(
      onWillPop: () async {
        if (store.controller.index != 0) {
          store.controller.jumpToTab(0);
        } else {
          return UIHelper.onWillPop(context);
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppConstants.white,
          body: PersistentTabView(
            context,
            controller: store.controller,
            screens: _children,
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.once,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 350),
              curve: Curves.fastOutSlowIn,
            ),
            onItemSelected: (index) {
              setState(() {
                store.currentIndex = index;
              });
            },
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 450),
            ),

            navBarStyle: NavBarStyle
                .style3, // Choose the nav bar style with this property.
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
