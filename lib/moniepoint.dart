import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:moniepoint_task/helper/theme.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/routes/route.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'app_init.dart';
import 'routes/route_list.dart';
import 'routes/route_observer.dart';
import 'services/navigation_service.dart';
import 'store/app_store.dart';

class MoniePoint extends StatefulWidget {
  const MoniePoint({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MoniePointState();
  }
}

class MoniePointState extends State<MoniePoint> with WidgetsBindingObserver {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        log('[MoniePointState] init mobile modules ..');
        // checkForInitialMessage();
        log('[MoniePointState] register modules .. DONE');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AppStore>(create: (_) => AppStore()),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            navigatorKey: locator<NavigationService>().navigatorKey,
            title: 'Shipment Ready',
            debugShowCheckedModeBanner: false,
            navigatorObservers: [
              MyRouteObserver(),
              // FirebaseAnalyticsObserver(analytics: analytics),
            ],
            home: const SafeArea(
              child: ScrollConfiguration(
                behavior: ScrollBehaviorModified(),
                child: Scaffold(
                  body: AppInit(
                    onNext: RouteList.home,
                  ),
                ),
              ),
            ),
            routes: Routes.getAll(),
            onGenerateRoute: Routes.getRouteGenerate,
            theme: appTheme,
            themeMode: ThemeMode.light,
          );
        }));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // await locator<AnalyticsService>()
        //     .getAnalyticsObserver()
        //     .analytics
        //     .logAppOpen();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        // await locator<AnalyticsService>().logAppClosed(name: 'app_closed');
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        break;
    }
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
