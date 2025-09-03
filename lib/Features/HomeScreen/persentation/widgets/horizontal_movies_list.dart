import 'package:flutter/material.dart';
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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
                          fontSize: 16,
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
        const SizedBox(height: 8),

        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () => onTapMovie(movie),
                child: Container(
                  width: 120,
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
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
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
                                      size: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      movie.rating?.toStringAsFixed(1) ?? '0',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
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
