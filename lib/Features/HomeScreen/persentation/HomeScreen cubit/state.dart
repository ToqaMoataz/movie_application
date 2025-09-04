import 'package:movie_app/Core/Models/user_model.dart';

import '../../../../Core/Models/MoviesResponse.dart';

abstract class HomeStates {}

class HomeState extends HomeStates {
  int genreIndex;
  int currTabIndex;
  UserModel? user;
  MoviesResponse? moviesSearchResponse;
  MoviesResponse? moviesBrowseResponse;
  MoviesResponse? availableNowResponse;

  // states
  RequestState searchMoviesRequestState;
  RequestState browseMoviesRequestState;
  RequestState profileMoviesRequestState;
  RequestState availableNowRequestState;

  final MoviesResponse? recentMoviesResponse;
  String? errorMessage;

  HomeState({
    this.currTabIndex = 0,
    this.genreIndex = 0,
    this.searchMoviesRequestState = RequestState.init,
    this.browseMoviesRequestState = RequestState.init,
    this.profileMoviesRequestState = RequestState.init,
    this.availableNowRequestState = RequestState.init,
    this.moviesSearchResponse,
    this.moviesBrowseResponse,
    this.availableNowResponse,
    this.recentMoviesResponse,
    this.errorMessage,
    this.user,
  });

  HomeState copyWith({
    int? currTabIndex,
    int? genreIndex,
    RequestState? searchMoviesRequestState,
    RequestState? browseMoviesRequestState,
    RequestState? profileMoviesRequestState,
    RequestState? availableNowRequestState,
    MoviesResponse? moviesSearchResponse,
    MoviesResponse? moviesBrowseResponse,
    MoviesResponse? availableNowResponse,
    MoviesResponse? recentMoviesResponse,
    String? errorMessage,
    UserModel? user,
  }) {
    return HomeState(
      currTabIndex: currTabIndex ?? this.currTabIndex,
      genreIndex: genreIndex ?? this.genreIndex,
      searchMoviesRequestState: searchMoviesRequestState ?? this.searchMoviesRequestState,
      profileMoviesRequestState: profileMoviesRequestState ?? this.profileMoviesRequestState,
      browseMoviesRequestState: browseMoviesRequestState ?? this.browseMoviesRequestState,
      availableNowRequestState:
          availableNowRequestState ?? this.availableNowRequestState,
      moviesSearchResponse: moviesSearchResponse ?? this.moviesSearchResponse,
      moviesBrowseResponse: moviesBrowseResponse ?? this.moviesBrowseResponse,
      availableNowResponse: availableNowResponse ?? this.availableNowResponse,
      recentMoviesResponse: recentMoviesResponse ?? this.recentMoviesResponse,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}

class HomeInitState extends HomeState {}

enum RequestState { init, loading, success, error }
