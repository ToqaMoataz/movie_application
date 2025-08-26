import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/Theme/app_theaming.dart';
import 'package:movie_app/Screens/Introduction%20Screen/introduction_screen.dart';
import 'package:movie_app/Screens/Login_Screen/login_screen.dart';

import 'Core/helper/preferences_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //await FirebaseFirestore.instance.disableNetwork();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  bool seen = await PreferencesHelper.isOnboardingSeen();
  print("Onboarding seen: $seen");
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp(initialOnboardingSeen: seen),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool initialOnboardingSeen;

  const MyApp({super.key, required this.initialOnboardingSeen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheming.theme,
          routes: {
            IntroductionScreen.routename: (context) => IntroductionScreen(),
            // RegisterScreen.routeName: (context) => RegisterScreen(),
            //LoginScreen.routeName: (context) => LoginScreen()
            LoginScreen.routename: (context) => LoginScreen(),
          },
          initialRoute: initialOnboardingSeen
              ? LoginScreen.routename
              : IntroductionScreen.routename,
        );
      },
    );
  }
}
