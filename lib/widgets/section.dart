import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SectionContainer extends StatelessWidget {
  final String title; // Section title
  final VoidCallback onSeeAllPressed; // Callback for "See All"
  final Widget content; // Content for the section (e.g., books list)

  const SectionContainer({
    Key? key,
    required this.title,
    required this.onSeeAllPressed,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Get.isDarkMode; // Check if dark mode is active

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              TextButton(
                onPressed: onSeeAllPressed,
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          // Section Content
          content,
        ],
      ),
    );
  }
}
