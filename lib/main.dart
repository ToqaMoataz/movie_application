import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/Core/Theme/app_theaming.dart';
import 'package:movie_app/Features/moviesDetails/persentation/movie_details_screen.dart';

import 'Core/Hive/hive_manager.dart';
import 'Features/Authentication/persentation/Forget Password Screen/forget_password_screen.dart';
import 'Features/Authentication/persentation/Login Screen/login_screen.dart';
import 'Features/Authentication/persentation/Regiser Screen/register_screen.dart';
import 'Features/HomeScreen/persentation/Home Screen/home_Screen.dart';
import 'Features/Update and Delete profile/persentation/Update Profile Screen/update_profile_screen.dart';
import 'Features/onboarding/domain/helper/preferences_helper.dart';
import 'Features/onboarding/persentation/Introduction Screen/introduction_screen.dart';
import 'firebase_options.dart';


// 1- safaa ebrahem
// 2- toqa moataz
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  await HiveManager.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool seen = await PreferencesHelper.isOnboardingSeen();
  runApp(
      EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          child: MyApp(initialOnboardingSeen: seen,)
      )
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
            IntroductionScreen.routeName: (context) => IntroductionScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            HomeScreen.routeName : (context) => HomeScreen(),
            ForgetPasswordScreen.routeName : (context) => ForgetPasswordScreen(),
            MovieDetailsScreen.routeName : (context) => MovieDetailsScreen(),
            UpdateProfileScreen.routeName : (context) => UpdateProfileScreen()
          },
          initialRoute: initialOnboardingSeen
              ? LoginScreen.routeName
              : IntroductionScreen.routeName,
        );
      },
    );
  }
}



