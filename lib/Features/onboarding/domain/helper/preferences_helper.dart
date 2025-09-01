import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String onboardingSeenKey = 'onboarding_screen';

  static Future<void> setOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingSeenKey, true);
  }

  static Future<bool> isOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingSeenKey) ?? false;
  }
}
