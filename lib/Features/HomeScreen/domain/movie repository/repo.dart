
import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Models/movie_model.dart';

abstract class MoviesRepository{

  //search_movies ✅
  Future<MoviesResponse> searchMovies(String movieName);
  //browse_movies)
  Future<MoviesResponse> listMoviesByGenre(String genre);
  Future<MoviesResponse> listLimitMoviesByGenre(String genre,int limit);
  //recent_movies
  Future<MoviesResponse> getRecentMovies();

  //list_of_movies
  Future<List<MovieResponse>> getMoviesByIDs(List<int> ids);
}