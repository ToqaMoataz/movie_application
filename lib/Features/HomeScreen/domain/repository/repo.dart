import 'package:movie_app/Core/APIs/api_manager.dart';
import 'package:movie_app/Core/APIs/contants_vars.dart';
import 'package:movie_app/Core/APIs/endpoints.dart';

import '../../../../Core/Models/MovieParentalGuidesResponse.dart';
import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Models/movie_model.dart';

abstract class MoviesRepository{

  //search_movies ✅
  Future<MoviesResponse> searchMovies(String movieName);
  //browse_movies
  Future<MoviesResponse> listMoviesByGenre(String genre);
  //recent_movies
  Future<MoviesResponse> getRecentMovies();

  //get_Movie_by_id✅
  Future<MovieResponse> getMovieByID(int id);
  //list_of_movies
  Future<List<MovieResponse>> getMoviesById(List<int> ids);

  /////////// Movie_Suggestions ✅
  Future<MoviesResponse> getMovieSuggestionsById(int id);

  /////////// Movie_Parental_Guides
  Future<MovieParentalGuidesResponse> getMovieParentalGuidesById(int id);

}