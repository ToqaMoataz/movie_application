import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Theme/app_colors.dart';

class AppTheming{
  static ThemeData theme=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.getBackgroundColor(),
      iconTheme: IconThemeData(
        color: AppColors.getAccentColor(),
        size: 21,
      ),
      titleTextStyle: GoogleFonts.roboto(
        color: AppColors.getAccentColor(),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.2
      ),
       centerTitle: true
    ),
    scaffoldBackgroundColor: AppColors.getBackgroundColor(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.getPrimaryColor(),
        selectedItemColor: Color(0XFFF6BD00),
        unselectedItemColor:  Color(0XFFFFFFFF),
        type: BottomNavigationBarType.fixed
    )
  );
}