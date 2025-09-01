import '../../../../Core/Models/MoviesResponse.dart';

abstract class HomeStates {}

class HomeState extends HomeStates {
  int genreIndex=0;
  int currTabIndex=0;
  MoviesResponse? moviesSearchResponse;
  MoviesResponse? moviesBrowseResponse;

  RequestState searchMoviesRequestState;
  RequestState browseMoviesRequestState;

  String? errorMessage;

  HomeState({
    this.currTabIndex = 0,
    this.genreIndex = 0,
    this.searchMoviesRequestState = RequestState.init,
    this.browseMoviesRequestState = RequestState.init,
    this.moviesSearchResponse,
    this.moviesBrowseResponse,
    this.errorMessage,
  });

  HomeState copyWith({
    int? currTabIndex,
    int? genreIndex,
    RequestState? searchMoviesRequestState,
    RequestState? browseMoviesRequestState,
    MoviesResponse? moviesSearchResponse,
    MoviesResponse? moviesBrowseResponse,
    String? errorMessage,
  }) {
    return HomeState(
      currTabIndex: currTabIndex ?? this.currTabIndex,
      genreIndex: genreIndex ?? this.genreIndex,
      searchMoviesRequestState:
      searchMoviesRequestState ?? this.searchMoviesRequestState,
      browseMoviesRequestState:
      browseMoviesRequestState ?? this.browseMoviesRequestState,
      moviesSearchResponse: moviesSearchResponse ?? this.moviesSearchResponse,
      moviesBrowseResponse: moviesBrowseResponse ?? this.moviesBrowseResponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class HomeInitState extends HomeState {}

enum RequestState { init, loading, success, error }
