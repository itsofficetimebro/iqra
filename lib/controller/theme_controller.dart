
import 'package:get/get.dart';
import '../theme/app_theme.dart';

class ThemeController extends GetxController {
  // Observable variable for theme
  RxBool isDarkMode = false.obs;

  // Toggle Theme Mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme);
  }
}
