import 'dart:ui';

import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Supported languages
  static final locale = Locale('en', 'US'); // Default language
  static final fallbackLocale = Locale('en', 'US'); // Fallback language

  // List of supported locales
  static final supportedLocales = [
    Locale('en', 'US'),
    Locale('bn', 'BD'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
      'welcome': 'Welcome to our app',
      'search_hint': 'Search your Product',
      'join_btn': 'Join Now',
      'most_popular': 'Most Popular',
      'more': 'See All',
    },
    'bn_BD': {
      'hello': 'হ্যালো',
      'welcome': 'আমাদের অ্যাপে স্বাগতম',
      'search_hint': 'আপনার বইটি খুজুন',
      'join_btn': 'যুক্ত হোন',
      'most_popular': 'জনপ্রিয়',
      'more': 'আরো দেখুন',
    },
  };

  // Change language method
  static void changeLocale(String langCode) {
    Locale locale = supportedLocales.firstWhere(
          (element) => element.languageCode == langCode,
      orElse: () => const Locale('en', 'US'),

    );
    Get.updateLocale(locale);
  }
}
