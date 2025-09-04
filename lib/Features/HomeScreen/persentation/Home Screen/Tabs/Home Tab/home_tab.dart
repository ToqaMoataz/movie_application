import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/assets/App%20Components/movie_card.dart';

import '../../../../../../Core/Theme/app_colors.dart';
import '../../../../../../Core/assets/app_images.dart';
import '../../../../../moviesDetails/persentation/movie_details_screen.dart';
import '../../../../data/local_data.dart';
import '../../../HomeScreen cubit/cubit.dart';
import '../../../HomeScreen cubit/state.dart';
import '../../../widgets/category_strip.dart';
import '../../../widgets/horizontal_movies_list.dart';
import 'GenreMoviesScreen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);

        // 🔹 الجزء العلوي: Recent Movies من getRecentMovies()
        final recentMovies = cubit.state.recentMoviesResponse?.data?.movies ??
            [];
        print("safa ebrahem ${recentMovies.length}");

        // 🔹 الجزء السفلي: Categories
        final genres = AppData.getMoviesGenres();
        final currentGenre = genres.isNotEmpty
            ? genres[state.genreIndex]
            : null;

        // الأفلام حسب النوع المختار
        final genreMovies = state.moviesBrowseResponse?.data?.movies ?? [];
        if (cubit.state.availableNowResponse == RequestState.loading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.getAccentColor(),
            ),
          );
        }

        return Scaffold(
          body: SafeArea(
            child: Stack(
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
                ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  children: [
                    // 🔹 Available Now Title
                    Image.asset(
                      AppImages.AvailableNow,
                      width: double.infinity,
                      height: 50.h,
                      alignment: Alignment.center,
                      fit: BoxFit.none,
                    ),
                    SizedBox(height: 8.h),

                    // 🔹 Available Now Carousel (دائمًا recentMovies)
                    SizedBox(
                      height: 250.h,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 250.h,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.7,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                        items: recentMovies.map((movie) {
                          return MovieCard(
                            rating: movie.rating ?? 0.0, // لو null يبقى 0.0
                            imgURL: movie.mediumCoverImage ??
                                "", // لو null يبقى ""
                          );
                        }).toList(), // لازم تتحول لقائمة
                      ),
                    ),


                    /*AvailableNowCarousel(
                          movies: recentMovies,
                          onTapMovie: (movie) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const MovieDetailsScreen(),
                                settings: RouteSettings(arguments: movie.id),
                              ),
                            );

                          },
                        ),*/
                    SizedBox(height: 8.h),

                    // 🔹 Watch Now Banner ثابتة
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          AppImages.WatchNow,
                          height: 60.h,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    SizedBox(height: 6.h),

                    // 🔹 Categories Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // 🔹 Category Strip
                    SizedBox(
                      height: 40,
                      child: CategoryStrip(
                        genres: genres,
                        currentIndex: state.genreIndex,
                        onTap: (index) => cubit.setGenreTabIndex(index),
                      ),
                    ),

                    SizedBox(height: 6.h),

                    // 🔹 Horizontal Movies List حسب النوع
                    HorizontalMoviesList(
                      title: currentGenre ?? "Category",
                      movies: genreMovies.take(3).toList(),
                      onSeeMore: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GenreMoviesScreen(
                                  title: currentGenre ?? "Category",
                                  movies: genreMovies,
                                ),
                          ),
                        );
                      },
                      onTapMovie: (movie) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MovieDetailsScreen(),
                            settings: RouteSettings(arguments: movie.id),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

      },
    );
  }
}
