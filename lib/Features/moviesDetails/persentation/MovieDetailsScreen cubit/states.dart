import '../../data/models/movie_model.dart';
import '../../../../../../Core/Models/MoviesResponse.dart';

enum RequestState { init, loading, success, error }

class MovieDetailsStates {
  final bool bookMarkTabbed;
  final RequestState tabIconState;

  final RequestState movieRequestState;
  final RequestState suggestionsRequestState;
  final RequestState watchMovieRequestState;

  final MovieResponse? movieResponse;
  final MoviesResponse? movieSuggestions;

  MovieDetailsStates({
    this.bookMarkTabbed = false,
    this.tabIconState = RequestState.init,
    this.movieRequestState = RequestState.init,
    this.suggestionsRequestState = RequestState.init,
    this.watchMovieRequestState = RequestState.init,
    this.movieResponse,
    this.movieSuggestions,
  });

  MovieDetailsStates copyWith({
    bool? bookMarkTabbed,
    RequestState? tabIconState,
    RequestState? movieRequestState,
    RequestState? suggestionsRequestState,
    RequestState? watchMovieRequestState,
    MovieResponse? movieResponse,
    MoviesResponse? movieSuggestions,
  }) {
    return MovieDetailsStates(
      bookMarkTabbed: bookMarkTabbed ?? this.bookMarkTabbed,
      tabIconState: tabIconState ?? this.tabIconState,
      movieRequestState: movieRequestState ?? this.movieRequestState,
      suggestionsRequestState:
          suggestionsRequestState ?? this.suggestionsRequestState,
      watchMovieRequestState:
          watchMovieRequestState ?? this.watchMovieRequestState,
      movieResponse: movieResponse ?? this.movieResponse,
      movieSuggestions: movieSuggestions ?? this.movieSuggestions,
    );
  }
}
