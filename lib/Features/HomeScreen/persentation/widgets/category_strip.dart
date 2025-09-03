import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryStrip extends StatelessWidget {
  final List<String> genres;
  final int currentIndex;
  final Function(int) onTap;

  const CategoryStrip({
    super.key,
    required this.genres,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final isSelected = index == currentIndex;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.white24),
                ),
                child: Center(
                  child: Text(
                    genres[index],
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
