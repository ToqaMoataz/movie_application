import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Theme/app_colors.dart';
import '../../../../../../../App Components/movie_card.dart';
import '../../../../HomeScreen cubit/cubit.dart';
import '../../../../HomeScreen cubit/state.dart';
import '../../../Movie Details Screen/movie_details_screen.dart';


class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Search Box
        Padding(
          padding: const EdgeInsets.only(
              top: 38, bottom: 4, left: 16, right: 16),
          child: Container(
            height: 56.h,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.getPrimaryColor(),
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded, color: AppColors.getIconColor()),
                SizedBox(width: 16.w),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        HomeCubit.get(context).searchMoviesByName(value);
                      } else {
                        HomeCubit.get(context).clearSearch();
                      }
                    },
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.getPrimaryTextColor(),
                        height: 1.2,
                        letterSpacing: 0),
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColors.getPrimaryTextColor(),
                          height: 1.2,
                          letterSpacing: 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Result Movies Section
        Expanded(
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              var movies = cubit.state.moviesSearchResponse?.data?.movies;

              if (_searchController.text.isEmpty) {
                return Center(
                  child: Image.asset("assets/images/empty.png"),
                );
              }

              if (cubit.state.searchMoviesRequestState==RequestState.loading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.getAccentColor(),
                  ),
                );
              }
              else if (cubit.state.searchMoviesRequestState==RequestState.success) {
                if (movies == null || movies.isEmpty) {
                  return Center(
                    child: Text(
                      "No movies found",
                      style: GoogleFonts.roboto(
                        fontSize: 24.sp,
                        color: AppColors.getAccentColor(),
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  padding: EdgeInsets.all(12.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MovieDetailsScreen.routeName,
                          arguments: movies[index].id,
                        );
                      },
                      child: MovieCard(
                        imgURL: movies[index].mediumCoverImage ?? "",
                        rating: movies[index].rating ?? 0.0,
                      ),
                    );
                  },
                );
              }
              else if (cubit.state.searchMoviesRequestState==RequestState.error) {
                return Center(
                  child: Text(
                    "Something went wrong",
                    style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
