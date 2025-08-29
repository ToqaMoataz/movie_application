import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/Theme/app_colors.dart';
import 'package:movie_app/Core/assets/app_images.dart';

class HomeTab extends StatelessWidget {
  static const String routeName = "homescreen";

  static const List<String> movieImages = [
    AppImages.Movie1,
    AppImages.Movie2,
    AppImages.Movie3,
  ];

  static const List<String> actionMovies = [
    AppImages.action1,
    AppImages.action2,
    AppImages.action3,
  ];

  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned.fill(
              child: Image.asset(
                AppImages.background_hometab,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.7)),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 40.h),
                width: 0.7.sw,
                height: 80.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.Available_Now),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 100.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 60.h),
                    buildCarousel(context),
                    SizedBox(height: 20.h),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 0.7.sw,
                        height: 80.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.Watch_Now),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Action",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "see more",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.getAccentColor(),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 18,
                                  color: AppColors.getAccentColor(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 180.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: actionMovies.length,
                        itemBuilder: (context, index) {
                          return buildActionCard(context, actionMovies[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //--------------------------
  Widget buildCarousel(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.h,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.6,
      ),
      items: movieImages.map((item) => buildMovieCard(context, item)).toList(),
    );
  }

  //-------------------------------------
  Widget buildMovieCard(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        print("Pressed on $imagePath");
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: AppColors.getAccentColor(), size: 16),
                  SizedBox(width: 4),
                  Text("7.7", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //------------------------------------------
  Widget buildActionCard(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        //ToDo
      },
      child: Stack(
        children: [
          Container(
            width: 120.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),

              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: AppColors.getAccentColor(), size: 16),
                  SizedBox(width: 4),
                  Text("7.7", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
