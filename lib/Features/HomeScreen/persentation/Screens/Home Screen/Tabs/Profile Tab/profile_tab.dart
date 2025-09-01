import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../Core/Theme/app_colors.dart';


class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile Tab",
        style: GoogleFonts.inter(
          color: AppColors.getAccentColor(),
          fontSize: 24.sp,
        ),
      ),
    );
  }
}
