import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/Theme/app_colors.dart';

import '../../../../Core/Models/MoviesResponse.dart';

class AvailableNowCarousel extends StatelessWidget {
  final List<Movies> movies;
  final void Function(Movies) onTapMovie;

  const AvailableNowCarousel({
    super.key,
    required this.movies,
    required this.onTapMovie,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.h,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 0.7,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: movies.map((movie) {
        return GestureDetector(
          onTap: () => onTapMovie(movie),
          child: SizedBox(
            height: 250.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    movie.mediumCoverImage ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/no image.png",
                        fit: BoxFit.cover,
                      );
                    },
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.getAccentColor(),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.rating?.toStringAsFixed(1) ?? "N/A",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
