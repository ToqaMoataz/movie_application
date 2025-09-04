import 'package:movie_app/Features/HomeScreen/domain/movie%20repository/repo.dart';
import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Models/movie_model.dart';


class MoviesLocalRepository implements MoviesRepository{

  @override
  Future<MoviesResponse> getMovieSuggestionsById(int id) {
    // TODO: implement getMovieSuggestionsById
    throw UnimplementedError();
  }

  @override
  Future<MoviesResponse> getRecentMovies() {
    // TODO: implement getRecentMovies
    throw UnimplementedError();
  }

  @override
  Future<MoviesResponse> listMoviesByGenre(String genre) {
    // TODO: implement listMoviesByGenre
    throw UnimplementedError();
  }

  @override
  Future<MoviesResponse> searchMovies(String movieName) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieResponse>> getMoviesByIDs(List<int> ids) {
    // TODO: implement getMoviesByIDs
    throw UnimplementedError();
  }

}