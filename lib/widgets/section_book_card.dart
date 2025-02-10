import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra/controller/theme_controller.dart';

class BookCard extends StatefulWidget {
  final String imagePath; // Path to the book image
  final String title; // Book title
  final String author; // Author name
  final double rating; // Rating
  final bool isAudioBook; // Whether the book is an audiobook

  const BookCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.author,
    required this.rating,
    required this.isAudioBook,
  }) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isWishlisted = false; // State to track wishlist

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDarkMode = Get.isDarkMode; // Check if dark mode is active
    final ThemeController themeController = Get.find();
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: 140.w, // Fixed width for each card
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Book Image with Wishlist Icon
          Container(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(10.r), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Subtle shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                  child: Image.asset(
                    widget.imagePath, // Book image path
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                    errorBuilder: (context, error, stackTrace) {
                      // Show default image if the image fails to load
                      return Image.asset(
                        "assets/images/default_book.png", // Path to the default image
                        height: 100.h,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishlisted = !isWishlisted; // Toggle wishlist state
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      size: 20.sp,
                      color: isWishlisted ? Colors.red : Colors.grey, // Change color
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Book Title with Emoji
                Row(
                  children: [
                    Text(
                      widget.isAudioBook ? "🎧" : "📚", // Show book type emoji
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        widget.title, // Book title
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, // Handle long titles
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),

                // Author Name
                Text(
                  widget.author,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),

                // Rating
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700], size: 14.sp), // Star icon
                    SizedBox(width: 4.w),
                    Text(
                      widget.rating.toStringAsFixed(1), // Rating value
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
