import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra/screens/home_screen.dart';
import 'package:iqra/utils/localization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Localized App',
      translations: LocalizationService(), // Set translations
      locale: LocalizationService.locale, // Default locale
      fallbackLocale: LocalizationService.fallbackLocale, // Fallback locale
      home: HomeScreen(),
    );
  }
}
