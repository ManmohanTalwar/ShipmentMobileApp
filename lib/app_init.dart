import 'dart:async';
import 'dart:developer';
import 'dart:developer';

import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/helper/logger.dart';
import 'package:moniepoint_task/injection.dart';
import 'package:moniepoint_task/routes/route_list.dart';
import 'package:moniepoint_task/store/app_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/auth/static_splashscreen.dart';
import 'services/services.dart';

class AppInit extends StatefulWidget {
  final String? onNext;

  const AppInit({Key? key, this.onNext}) : super(key: key);

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  bool? hidePopUp;
  late AppPrefs prefs;

  @override
  void initState() {
    super.initState();
    hidePopUp = false;
    loadInitData();
  }

  void hideNotification(bool value) {
    setState(() {
      hidePopUp = value;
    });
  }

  Future loadInitData() async {
    try {
      /// Load App model config
      prefs = locator<AppPrefs>();
      Services().setAppServices();
      await Future.delayed(
        Duration.zero,
        () async {
          if (locator<AppPrefs>().isLoggedIn.getValue()) {
            /// initialize apis
          }
          //TODO
          // await locator<AnalyticsService>()
          //     .getAnalyticsObserver()
          //     .analytics
          //     .logAppOpen();
        },
      );
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return StaticSplashScreen(
      duration: 3000,
      isLottie: true,
      onNextScreen: onNextScreen(),
    );
  }

  String onNextScreen() {
    logger.i('IS FIRST OPEN: -> ${locator<AppPrefs>().isFirstOpen.getValue()}');
    return locator<AppPrefs>().isFirstOpen.getValue()
        ? RouteList.onBoardingScreen
        : RouteList.home;
  }
}
