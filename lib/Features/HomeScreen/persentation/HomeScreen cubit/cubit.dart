import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/HomeScreen/persentation/HomeScreen cubit/state.dart';

import '../../data/local_data.dart';
import '../../domain/movie repository/repo.dart';
//import '../../domain/repository/repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitState());

// داخل HomeCubit class

  Future<void> loadHome() async {
    try {
      // notify loading if حابة تضيفي حالة خاصة هنا
      emit(state.copyWith(browseMoviesRequestState: RequestState.loading));
      final recent = await repo.getRecentMovies();
      // بعد ما نجيب recent نعرضه في browseMoviesResponse مؤقتًا
      emit(state.copyWith(
        browseMoviesRequestState: RequestState.success,
        moviesBrowseResponse: recent,
      ));
    } catch (e) {
      emit(state.copyWith(
        browseMoviesRequestState: RequestState.error,
        errorMessage: e.toString(),
      ));
    }
  }

  final MoviesRepository repo;

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  // Set main tab index
  void setTabIndex(int index) {
    emit(state.copyWith(currTabIndex: index));
    if (index == 2) {
      browseByGenre();
    }
  }

  // Set genre tab index
  void setGenreTabIndex(int index) {
    emit(state.copyWith(genreIndex: index));
    browseByGenre();
  }

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
}
