
import '../../../../Core/Models/MoviesResponse.dart';
import '../../../moviesDetails/data/models/movie_model.dart';

abstract class MoviesRepository{

  //search_movies ✅
  Future<MoviesResponse> searchMovies(String movieName);
  //browse_movies
  Future<MoviesResponse> listMoviesByGenre(String genre);
  //recent_movies
  Future<MoviesResponse> getRecentMovies();

  //list_of_movies
  Future<List<MovieResponse>> getMoviesById(List<int> ids);
}