import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/Theme/app_colors.dart';

import '../../../../Core/Models/MoviesResponse.dart';

class HorizontalMoviesList extends StatelessWidget {
  final String title;
  final List<Movies> movies;
  final void Function(Movies) onTapMovie;
  final VoidCallback? onSeeMore;

  const HorizontalMoviesList({
    super.key,
    required this.title,
    required this.movies,
    required this.onTapMovie,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              if (onSeeMore != null)
                TextButton(
                  onPressed: onSeeMore,
                  child: Row(
                    children: [
                      Text(
                        "See More",
                        style: TextStyle(
                          color: AppColors.getAccentColor(),
                          fontSize: 16.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.getAccentColor(),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.h),

        SizedBox(
          height: 220.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () => onTapMovie(movie),
                child: Container(
                  width: 120.w,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            // Movie Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                movie.mediumCoverImage ?? "",
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            // Rating overlay
                            Positioned(
                              top: 8.h,
                              left: 8.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.getAccentColor(),
                                      size: 14.sp,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      movie.rating?.toStringAsFixed(1) ?? '0',
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
                      const SizedBox(height: 4),
                      Text(
                        movie.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
