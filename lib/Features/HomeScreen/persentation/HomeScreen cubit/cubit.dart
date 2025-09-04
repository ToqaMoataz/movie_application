import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Core/Models/movie_model.dart';
import 'package:movie_app/Core/Models/user_model.dart';
import 'package:movie_app/Features/Authentication/persentation/Login%20Screen/login_screen.dart';
import 'package:movie_app/Features/HomeScreen/domain/user%20repository/user_repo.dart';
import 'package:movie_app/Features/HomeScreen/persentation/HomeScreen cubit/state.dart';

import '../../../../../../Core/Models/MoviesResponse.dart';
import '../../data/local_data.dart';
import '../../domain/movie repository/repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo,this.userRepo) : super(HomeInitState());

  final MoviesRepository repo;
  final UserRepo userRepo;

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  // Set main tab index
  void setTabIndex(int index) {
    emit(state.copyWith(currTabIndex: index));
    if (index == 2) {
      browseByGenre();
    }
    else if (index == 3) {
      getCurrentUser();
    }
  }

  // Set genre tab index
  void setGenreTabIndex(int index) {
    emit(state.copyWith(genreIndex: index));
    browseByGenre();
  }
  //HomeTab
  // Search Tab
  Future<void> searchMoviesByName(String search) async {
    try {
      emit(state.copyWith(searchMoviesRequestState: RequestState.loading));
      final response = await repo.searchMovies(search);
      emit(state.copyWith(
        searchMoviesRequestState: RequestState.success,
        moviesSearchResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        searchMoviesRequestState: RequestState.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void clearSearch() {
    emit(state.copyWith(moviesSearchResponse: null, searchMoviesRequestState: RequestState.init,));
  }

  // Browse Tab
  Future<void> browseByGenre() async {
    try {
      emit(state.copyWith(browseMoviesRequestState: RequestState.loading));
      final genres = AppData.getMoviesGenres();
      final response = await repo.listMoviesByGenre(genres[state.genreIndex]);
      emit(state.copyWith(
        browseMoviesRequestState: RequestState.success,
        moviesBrowseResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        browseMoviesRequestState: RequestState.error,
        errorMessage: e.toString(),
      ));
    }
  }
  //Profile Tab
  void toggleVisibility() {
    emit(state.copyWith(isVisible: !state.isVisible));
  }

  Future<void> getCurrentUser() async {
    try {
      emit(state.copyWith(profileMoviesRequestState: RequestState.loading));
      if (FirebaseAuth.instance.currentUser != null) {
        UserModel? response = await userRepo.readCurrUser();
        // print("user in response ${response?.name}");
        await returnHistoryList(response?.historyList);
        await returnToWatchList(response?.toWatchList);
        emit(state.copyWith(
          profileMoviesRequestState: RequestState.success,
          user: response,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        profileMoviesRequestState: RequestState.error,
        errorMessage: e.toString(),
      ));
    }
  }
  Future<void> returnHistoryList(List<int>? moviesIds) async {
    try{
      emit(state.copyWith(historyMoviesRequestState: RequestState.loading));
      List<MovieResponse>? movies = await repo.getMoviesByIDs(moviesIds!);
      emit(state.copyWith(
        historyMoviesResponse: movies,
        historyMoviesRequestState: RequestState.success,
      ));
    }catch(e){
      emit(state.copyWith(historyMoviesRequestState: RequestState.error,errorMessage: e.toString(),));
    }

  }

  Future<void> returnToWatchList(List<int>? moviesIds) async {
    try{
      emit(state.copyWith(toWatchMoviesRequestState: RequestState.loading));
      List<MovieResponse>? movies = await repo.getMoviesByIDs(moviesIds!);
      emit(state.copyWith(
        toWatchMoviesResponse: movies,
        toWatchMoviesRequestState: RequestState.success,
      ));
    }catch(e){
      emit(state.copyWith(toWatchMoviesRequestState: RequestState.error,errorMessage: e.toString(),));
    }
  }
  Future<void> signOut() async {
    try {
      emit(state.copyWith(signOutRequestState: RequestState.loading));
      await userRepo.signOutUser();
      emit(state.copyWith(signOutRequestState: RequestState.success));
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   LoginScreen.routeName,
      //       (route) => false, // removes all previous routes
      // );
    } catch (e) {
      emit(state.copyWith(signOutRequestState: RequestState.error,errorMessage: e.toString(),));
      print("Sign out error: $e");
    }
  }


}
