import 'package:movie_app/Core/Models/user_model.dart';
import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Models/movie_model.dart';

abstract class HomeStates {}

class HomeState extends HomeStates {
  int genreIndex;
  int currTabIndex;
  UserModel? user;

  MoviesResponse? moviesSearchResponse;
  MoviesResponse? moviesBrowseResponse;
  List<MovieResponse>? toWatchMoviesResponse;
  List<MovieResponse>? historyMoviesResponse;

  RequestState searchMoviesRequestState;
  RequestState browseMoviesRequestState;
  RequestState profileMoviesRequestState;
  RequestState toWatchMoviesRequestState;
  RequestState historyMoviesRequestState;
  RequestState signOutRequestState;  // 👈 هنا

  String? errorMessage;

  bool isVisible;

  HomeState({
    this.currTabIndex = 0,
    this.genreIndex = 0,
    this.searchMoviesRequestState = RequestState.init,
    this.browseMoviesRequestState = RequestState.init,
    this.profileMoviesRequestState = RequestState.init,
    this.toWatchMoviesRequestState = RequestState.init,
    this.historyMoviesRequestState = RequestState.init,
    this.signOutRequestState = RequestState.init, // 👈 هنا
    this.moviesSearchResponse,
    this.moviesBrowseResponse,
    this.toWatchMoviesResponse,
    this.historyMoviesResponse,
    this.errorMessage,
    this.user,
    this.isVisible = true,
  });

  HomeState copyWith({
    int? currTabIndex,
    int? genreIndex,
    RequestState? searchMoviesRequestState,
    RequestState? browseMoviesRequestState,
    RequestState? profileMoviesRequestState,
    RequestState? toWatchMoviesRequestState,
    RequestState? historyMoviesRequestState,
    RequestState? signOutRequestState, // 👈 هنا
    MoviesResponse? moviesSearchResponse,
    MoviesResponse? moviesBrowseResponse,
    List<MovieResponse>? toWatchMoviesResponse,
    List<MovieResponse>? historyMoviesResponse,
    String? errorMessage,
    UserModel? user,
    bool? isVisible,
  }) {
    return HomeState(
      currTabIndex: currTabIndex ?? this.currTabIndex,
      genreIndex: genreIndex ?? this.genreIndex,
      searchMoviesRequestState: searchMoviesRequestState ?? this.searchMoviesRequestState,
      browseMoviesRequestState: browseMoviesRequestState ?? this.browseMoviesRequestState,
      profileMoviesRequestState: profileMoviesRequestState ?? this.profileMoviesRequestState,
      toWatchMoviesRequestState: toWatchMoviesRequestState ?? this.toWatchMoviesRequestState,
      historyMoviesRequestState: historyMoviesRequestState ?? this.historyMoviesRequestState,
      signOutRequestState: signOutRequestState ?? this.signOutRequestState, // 👈 هنا
      moviesSearchResponse: moviesSearchResponse ?? this.moviesSearchResponse,
      moviesBrowseResponse: moviesBrowseResponse ?? this.moviesBrowseResponse,
      toWatchMoviesResponse: toWatchMoviesResponse ?? this.toWatchMoviesResponse,
      historyMoviesResponse: historyMoviesResponse ?? this.historyMoviesResponse,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}


class HomeInitState extends HomeState {}

enum RequestState { init, loading, success, error }
