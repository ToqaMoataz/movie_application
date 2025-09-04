import 'package:movie_app/Core/Models/user_model.dart';
import '../../../../Core/Models/MoviesResponse.dart';

abstract class HomeStates {}

class HomeState extends HomeStates {
  int genreIndex;
  int currTabIndex;
  int generatedGenres;
  String? carouselBackgroundImg;
  UserModel? user;

  MoviesResponse? moviesSearchResponse;
  MoviesResponse? moviesBrowseResponse;
  MoviesResponse? recentMoviesResponse;

  List<Map<String, MoviesResponse>> moviesByGenreList;

  RequestState searchMoviesRequestState;
  RequestState browseMoviesRequestState;
  RequestState profileMoviesRequestState;
  RequestState recentMoviesRequestState;
  RequestState moviesByGenreRequestState;

  String? errorMessage;

  HomeState({
    this.currTabIndex = 0,
    this.genreIndex = 0,
    this.generatedGenres = 0,
    this.carouselBackgroundImg,
    this.searchMoviesRequestState = RequestState.init,
    this.browseMoviesRequestState = RequestState.init,
    this.profileMoviesRequestState = RequestState.init,
    this.recentMoviesRequestState = RequestState.init,
    this.moviesSearchResponse,
    this.moviesBrowseResponse,
    this.recentMoviesResponse,
    this.moviesByGenreList = const [],
    this.moviesByGenreRequestState = RequestState.init,
    this.errorMessage,
    this.user,
  });

  HomeState copyWith({
    int? currTabIndex,
    int? genreIndex,
    int? generatedGenres,
    String? carouselBackgroundImg,
    RequestState? searchMoviesRequestState,
    RequestState? browseMoviesRequestState,
    RequestState? profileMoviesRequestState,
    RequestState? recentMoviesRequestState,
    RequestState? moviesByGenreRequestState,
    MoviesResponse? moviesSearchResponse,
    MoviesResponse? moviesBrowseResponse,
    MoviesResponse? recentMoviesResponse,
    List<Map<String, MoviesResponse>>? moviesByGenreList,
    String? errorMessage,
    UserModel? user,
  }) {
    return HomeState(
      currTabIndex: currTabIndex ?? this.currTabIndex,
      genreIndex: genreIndex ?? this.genreIndex,
      generatedGenres: generatedGenres ?? this.generatedGenres,
      carouselBackgroundImg: carouselBackgroundImg ?? this.carouselBackgroundImg,
      searchMoviesRequestState: searchMoviesRequestState ?? this.searchMoviesRequestState,
      profileMoviesRequestState: profileMoviesRequestState ?? this.profileMoviesRequestState,
      browseMoviesRequestState: browseMoviesRequestState ?? this.browseMoviesRequestState,
      recentMoviesRequestState: recentMoviesRequestState ?? this.recentMoviesRequestState,
      moviesByGenreRequestState: moviesByGenreRequestState ?? this.moviesByGenreRequestState,
      moviesSearchResponse: moviesSearchResponse ?? this.moviesSearchResponse,
      moviesBrowseResponse: moviesBrowseResponse ?? this.moviesBrowseResponse,
      recentMoviesResponse: recentMoviesResponse ?? this.recentMoviesResponse,
      moviesByGenreList: moviesByGenreList ?? this.moviesByGenreList,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}

class HomeInitState extends HomeState {}

enum RequestState { init, loading, success, error }
