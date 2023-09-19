import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/injection.dart';

class ApiConfig {
  static const String baseUrl =
      'https://www.moniepoint_tasklives.com/admin/api/';
  static const String privacyPolicy = '';
  static const String aboutUs = '';
  static const String termsOfUse = '';
  static const bool isProd = true;
}

class AuthApiUrls {
  static const loginWithMobile = '${ApiConfig.baseUrl}sendotp.php';
  static const verifyOtp = '${ApiConfig.baseUrl}login.php';
  static const register = '${ApiConfig.baseUrl}add-register.php';
  static const loginWithEmail = '${ApiConfig.baseUrl}otp/send-otp-email';
}
