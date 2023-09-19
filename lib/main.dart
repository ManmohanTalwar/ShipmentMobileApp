import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/moniepoint.dart';
import 'package:moniepoint_task/services/navigation_service.dart';
import 'package:moniepoint_task/services/network_util.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

final GetIt locator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await setupLocator();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppConstants.primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const MoniePoint());
}

Future<void> setupLocator() async {
  final preferences = await StreamingSharedPreferences.instance;
  locator.registerLazySingleton<AppPrefs>(() => AppPrefs(preferences));
  locator.registerLazySingleton<NetworkUtil>(() => NetworkUtil());
  locator.registerLazySingleton(() => NavigationService());
}

extension ContextExtentions on BuildContext {
  double getHeight() => MediaQuery.of(this).size.height;
  double getWidth() => MediaQuery.of(this).size.width;
  MediaQueryData getQuery() => MediaQuery.of(this);

  Color white() => AppConstants.white;
  Color black() => AppConstants.black;
  Color primaryColor() => AppConstants.primaryColor;
  Color dividerColor() => const Color(0xfff3f3f3);
  Color accentColor() => AppConstants.accentColor;
  TextStyle customStyle({
    FontWeight? fontWeight,
    Color? color,
    double? size,
    TextDecoration? decoration,
  }) =>
      AppConstants.customNormal(
        color: color,
        size: size,
        weight: fontWeight,
      );
}
