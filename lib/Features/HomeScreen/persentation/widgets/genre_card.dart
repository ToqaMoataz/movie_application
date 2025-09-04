import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Features/HomeScreen/persentation/Home%20Screen/Tabs/Home%20Tab/GenreMoviesScreen.dart';

import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/assets/App Components/movie_card.dart';
import '../../../moviesDetails/persentation/movie_details_screen.dart';

class GenreCard extends StatelessWidget {
  final String genre;
  final List<Movies> movies;

  const GenreCard({
    Key? key,
    required this.genre,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Text("No movies available for $genre"),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(genre, style: GoogleFonts.roboto(
                color: AppColors.getPrimaryTextColor(),
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                height: 1.2,
                letterSpacing: 0,
              )),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    GenreMoviesScreen.routeName,
                    arguments: {
                      "genre": genre,
                      "movies": movies,
                    },
                  );
                },
                child: Text("See More", style: GoogleFonts.roboto(
                  color: AppColors.getAccentColor(),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  letterSpacing: 0,
                )),
              ),
            ],
          ),
          SizedBox(height: 4.h,),
          SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: movie.id);
                    },
                    child: MovieCard(
                      rating: movie.rating ?? 0.0,
                      imgURL: movie.mediumCoverImage ?? "",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
