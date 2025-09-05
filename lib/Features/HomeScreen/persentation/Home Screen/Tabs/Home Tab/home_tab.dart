import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/assets/App%20Components/movie_card.dart';
import 'package:movie_app/Features/HomeScreen/persentation/widgets/genre_card.dart';
import '../../../../../../Core/Theme/app_colors.dart';
import '../../../../../../Core/assets/app_images.dart';
import '../../../../../moviesDetails/persentation/movie_details_screen.dart';
import '../../../../data/local_data.dart';
import '../../../HomeScreen cubit/cubit.dart';
import '../../../HomeScreen cubit/state.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    final cubit = HomeCubit.get(context);
    cubit.getLimitedMoviesByGenre();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        final recentMovies = state.recentMoviesResponse?.data?.movies;

        if (state.recentMoviesRequestState == RequestState.loading ||
            state.moviesByGenreRequestState == RequestState.loading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.getAccentColor(),
            ),
          );
        }

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.3,
                          child: state.carouselBackgroundImg != null
                            ? Image.network(
                                cubit.state.carouselBackgroundImg!,
                                fit: BoxFit.cover,
                            )
                            : Container(color: Colors.black), // fallback
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Column(
                        children: [
                          Image.asset(
                            AppImages.AvailableNow,
                            width: double.infinity,
                            height: 50.h,
                            alignment: Alignment.center,
                            fit: BoxFit.none,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 22),
                            child: SizedBox(
                              height: 250.h,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 250.h,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: true,
                                  viewportFraction: 0.55,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  onPageChanged: (index, reason) {
                                    cubit.setCarouselIndex(index, recentMovies?[index].mediumCoverImage??"");
                                  },
                                ),
                                items: recentMovies?.map((movie) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: movie.id);
                                    },
                                    child: MovieCard(
                                      rating: movie.rating ?? 0.0,
                                      imgURL: movie.mediumCoverImage ?? "",
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const Image(image: AssetImage(AppImages.WatchNow)),
                        ],
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final genreMap = state.moviesByGenreList[index];
                      final genre = genreMap.entries.first.key;
                      final response = genreMap.entries.first.value;
                       int genreIndex=AppData.getMoviesGenres().indexOf(genre);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                        child: GenreCard(
                          genre: genre,
                          movies: response.data?.movies?.take(10).toList() ?? [],
                          onTap: (){
                            cubit.setGenreTabIndex(genreIndex);
                            cubit.setTabIndex(2);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 4.h),
                    itemCount: state.moviesByGenreList.length,
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
