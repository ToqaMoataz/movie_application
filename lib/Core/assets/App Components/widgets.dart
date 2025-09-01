import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Theme/app_colors.dart';

class AppWidgets{

  static loadingDialogWidget(context){
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.getBackgroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: AppColors.getAccentColor(),
            width: 2,
          ),
        ),
        content: Center(
          heightFactor: 1,
          child: CircularProgressIndicator(
            color: AppColors.getAccentColor(),
          ),
        ),
      ),
    );
  }

  static errorDialogWidget(BuildContext context, String errorMessage) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.getBackgroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: AppColors.getAccentColor(),
            width: 2,
          ),
        ),
        title: Text(
          "Error",
          style: GoogleFonts.roboto(
            fontSize: 14.sp,
            color: AppColors.getAccentColor(),
            fontWeight: FontWeight.w400,
          ),
        ),
        content: Text(
          errorMessage,
          style: GoogleFonts.roboto(
            fontSize: 12.sp,
            color: Colors.white, // optional if your background is dark
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              "OK",
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                color: AppColors.getAccentColor(),
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  static void successDialogWidget(BuildContext context, {String? message, VoidCallback? onComplete}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.getBackgroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: AppColors.getAccentColor(),
            width: 2,
          ),
        ),
        content: Text(
          message ?? "Success",
          style: GoogleFonts.roboto(
            fontSize: 14.sp,
            color: AppColors.getAccentColor(),
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context, rootNavigator: true).pop();
      if (onComplete != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onComplete();
        });
      }
    });
  }


}