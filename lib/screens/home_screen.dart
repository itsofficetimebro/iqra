import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:iqra/controller/theme_controller.dart';
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
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // White for light mode
      body: Column(
        children: [
          // Custom AppBar inside the Body
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[900] : Colors.white, // AppBar background color
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
                                hintText: "Search book",
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
                                  "Join Now",
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
          //Most Populer
          SectionContainer(
            title: "Most Popular",
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
