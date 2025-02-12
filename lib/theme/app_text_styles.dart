import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyMediumText = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );
}
