



import 'package:movie_app/Features/HomeScreen/domain/repository/repo.dart';

import '../../../../Core/Models/MovieParentalGuidesResponse.dart';
import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Models/movie_model.dart';


class MoviesLocalRepository implements MoviesRepository{
  @override
  Future<MovieResponse> getMovieByID(int id) {
    // TODO: implement getMovieByID
    throw UnimplementedError();
  }

  @override
  Future<MovieParentalGuidesResponse> getMovieParentalGuidesById(int id) {
    // TODO: implement getMovieParentalGuidesById
    throw UnimplementedError();
  }

  @override
  Future<MoviesResponse> getMovieSuggestionsById(int id) {
    // TODO: implement getMovieSuggestionsById
    throw UnimplementedError();
  }

  @override
  Future<List<MovieResponse>> getMoviesById(List<int> ids) {
    // TODO: implement getMoviesById
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

}