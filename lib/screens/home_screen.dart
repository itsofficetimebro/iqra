import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:iqra/controller/theme_controller.dart';
import 'package:iqra/utils/localization.dart';
import 'package:iqra/widgets/section.dart';
import 'package:iqra/widgets/section_book_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'En', 'flag': '🇺🇸'}, // English with USA flag
    {'code': 'bn', 'name': 'Bn', 'flag': '🇧🇩'}, // Bangla with BD flag
  ];
  @override
  void initState() {
    super.initState();
    // Auto-slide every 3 seconds
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < 2) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Get.isDarkMode; // Check if dark mode is active
    final ThemeController themeController = Get.find();
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF121212) : Colors.white, // White for light mode
      body: Column(
        children: [
          // Custom AppBar inside the Body
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isDarkMode ? Color(0xFF202020) : Colors.white, // AppBar background color
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // BookHub Logo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "BookHub",
                      style: GoogleFonts.pacifico(
                        fontSize: 20.sp,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  // Search Bar
                  Expanded(
                    child: Container(
                      height: 35.h,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Light grey background
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search, color: Colors.grey[600], size: 18.sp),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center, // Ensures text is vertically centered
                              style: TextStyle(fontSize: 12.sp, color: Colors.black), // Text style
                              decoration: InputDecoration(
                                hintText: 'search_hint'.tr,
                                hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                                border: InputBorder.none,
                                isCollapsed: true, // Ensures the text stays centered
                                contentPadding: EdgeInsets.symmetric(vertical: 10.h), // Adjust for perfect centering
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.mic, color: Colors.grey[600], size: 18.sp),
                            onPressed: () {
                              print("Text-to-voice activated");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Wishlist & Notifications
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.grey[700]),
                        onPressed: () {
                          print("Wishlist clicked");
                        },
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.notifications, color: Colors.grey[700]),
                            onPressed: () {
                              print("Notifications clicked");
                            },
                          ),
                          Positioned(
                            right: 6.w,
                            top: 6.h,
                            child: Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "3", // Badge number
                                style: TextStyle(color: Colors.white, fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Body Content Below Custom AppBar
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 180.h, // Slider height
            width: double.infinity, // Full-width PageView
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0); // Adjust scale for effect
                    }
                    return Transform.scale(
                      scale: value, // Scale the card inside the slider
                      child: child,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: LinearGradient(
                        colors: [Colors.purple.shade900, Colors.blue.shade900],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Text and Button on Left
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Premium Member Exclusive",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Get 3 months free + 50% off annual plan",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(
                                  'join_btn'.tr,
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Spacer to keep the layout clean
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Pagination Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 8.h,
                width: _currentIndex == index ? 12.w : 8.w,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
            }),
          ),
          // Langueges change
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Welcome
                Text(
                  'welcome'.tr,
                  style: TextStyle(fontSize: 20, color: Colors.blue), // Styled text
                ),
                // Language Selection Dropdown
                Container(
                  width: 70.w,
                  height: 30.h,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: Get.locale?.languageCode ?? 'en',
                      onChanged: (String? newLang) {
                        if (newLang != null) {
                          LocalizationService.changeLocale(newLang);
                        }
                      },
                      icon: Icon(Icons.arrow_drop_down_sharp, size: 16.sp, color: Colors.blueAccent), // 🔹 Custom dropdown icon
                      dropdownColor: isDarkMode ? Color(0xFF202020): Colors.white, // 🔹 Background color of expanded dropdown
                      borderRadius: BorderRadius.circular(10), // 🔹 Border radius for dropdown menu
                      items: languages.map((lang) {
                        return DropdownMenuItem<String>(
                          value: lang['code'],
                          child: Row(
                            children: [
                              Text(lang['flag']!, style: TextStyle(fontSize: 10.sp, )), // Flag
                              SizedBox(width: 5),
                              Text(
                                lang['name']!,
                                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black,),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Most Populer
          SectionContainer(
            title: 'most_popular'.tr,
            onSeeAllPressed: () {
              print("See All Clicked");
            },
            content: SizedBox(
              height: 250.h, // Height for the book list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of books
                itemBuilder: (context, index) {
                  return BookCard(
                    imagePath: "assets/images/img.png", // Example image paths
                    title: index == 0
                        ? "The Silent Echo"
                        : index == 1
                        ? "My Grandmother Asked Me to Tell You She's Sorry."
                        : "The Lost Horizon", // Example titles
                    author: "Fredrik Backman ${index + 1}", // Example authors
                    rating: index == 0
                        ? 4.8
                        : index == 1
                        ? 4.7
                        : 4.6, // Example ratings
                    isAudioBook: index % 2 == 0, // Alternate book types
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        themeController.toggleTheme();
      }, child:Obx(() => Icon(
    themeController.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
    )) ,),
    );
  }
}
