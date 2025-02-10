import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';
import 'app_fonts.dart';

class AppTextStyles {
  static TextStyle heading1 =  GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.lightPrimary,
    // fontFamily: AppFonts.primaryFont,
  );

  static  TextStyle heading2 =  GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.lightPrimary,
  );

  static  TextStyle bodyText =  GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.lightPrimary,
  );
  static  TextStyle bodyMediumText = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    // color: AppColors.lightPrimary,
  );

}
