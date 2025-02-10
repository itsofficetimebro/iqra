import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_text_styles.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    cardColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: TextTheme(
      displayLarge: AppTextStyles.heading1.copyWith(color: AppColors.lightText),
      displayMedium: AppTextStyles.heading2.copyWith(color: AppColors.lightText),
      bodyLarge: AppTextStyles.bodyText.copyWith(color: AppColors.lightText),
      bodyMedium: AppTextStyles.bodyMediumText.copyWith(color: AppColors.lightSubText),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      elevation: 0,
      titleTextStyle: AppTextStyles.heading1.copyWith(color: Colors.white),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    cardColor: AppColors.lightSecondary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: TextTheme(
      displayLarge: AppTextStyles.heading1.copyWith(color: AppColors.darkText),
      displayMedium: AppTextStyles.heading2.copyWith(color: AppColors.darkText),
      bodyLarge: AppTextStyles.bodyText.copyWith(color: AppColors.darkText),
      bodyMedium: AppTextStyles.bodyMediumText.copyWith(color: AppColors.darkSubText),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      elevation: 0,
      titleTextStyle: AppTextStyles.heading1.copyWith(color: Colors.white),
    ),
  );
}
