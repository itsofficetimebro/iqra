import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Get.isDarkMode; // GetX checks if dark mode is enabled

    return InkWell(
      onTap: onPressed, // Trigger onPressed when tapped
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : Colors.white, // White for light mode
          borderRadius: BorderRadius.circular(20.r), // Responsive border radius
          boxShadow: [
            if (!isDarkMode)
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.r, // Responsive shadow blur
                spreadRadius: 2.r,
                offset: Offset(0, 3),
              ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w), // Responsive padding
        margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w), // Responsive margin
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.sp, // Responsive font size
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
