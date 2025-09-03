import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/assets/app_images.dart';
import 'package:movie_app/Features/HomeScreen/data/local_data.dart';

import '../../../../../moviesDetails/persentation/movie_details_screen.dart';
import '../../../HomeScreen cubit/cubit.dart';
import '../../../HomeScreen cubit/state.dart';
import '../../../widgets/available_now_carousel.dart';
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

        final allRecentMovies = state.moviesBrowseResponse?.data?.movies ?? [];
        final recentMoviesCarousel = allRecentMovies.take(3).toList();

        final genres = AppData.getMoviesGenres();
        final currentGenre = genres.isNotEmpty
            ? genres[state.genreIndex]
            : null;
        final genreMovies = state.moviesBrowseResponse?.data?.movies ?? [];

        return ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) =>
              Scaffold(
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
                            horizontal: 16.w, vertical: 16.h),
                        children: [

                          Expanded(
                            child: Image.asset(
                              AppImages.AvailableNow,
                              width: double.infinity,
                              height: 50.h,
                              alignment: Alignment.center,
                              fit: BoxFit.none,
                            ),
                          ),
                          SizedBox(height: 8.h),

                          Expanded(
                            child: SizedBox(
                              height: 250.h,
                              child: AvailableNowCarousel(
                                movies: recentMoviesCarousel,
                                onTapMovie: (movie) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (
                                          context) => const MovieDetailsScreen(),
                                      settings: RouteSettings(
                                          arguments: movie.id),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          SizedBox(height: 8.h),
                          Expanded(
                            child: Padding(
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
                          ),

                          SizedBox(height: 6.h),
                          Expanded(
                            child: Align(
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
                          ),
                          SizedBox(height: 8.h),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: CategoryStrip(
                                genres: genres,
                                currentIndex: state.genreIndex,
                                onTap: (index) => cubit.setGenreTabIndex(index),
                              ),
                            ),
                          ),

                          SizedBox(height: 6.h),

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
                                  builder: (
                                      context) => const MovieDetailsScreen(),
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
              ),
        );
      },
    );
  }
}
