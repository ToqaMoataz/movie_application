import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Theme/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Home Tab",
        style: GoogleFonts.inter(
          color: AppColors.getAccentColor(),
          fontSize: 24.sp,
        ),
      ),
    );
  }
}
