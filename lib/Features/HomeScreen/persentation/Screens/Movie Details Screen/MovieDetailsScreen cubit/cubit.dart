import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Core/APIs/api_manager.dart';
import 'package:movie_app/Features/HomeScreen/persentation/Screens/Movie%20Details%20Screen/MovieDetailsScreen%20cubit/states.dart';

import '../../../../../../Core/Models/MoviesResponse.dart';
import '../../../../../../Core/Models/movie_model.dart';
import '../../../../domain/repository/repo.dart';



class MovieDetailsCubit extends Cubit<MovieDetailsStates>{
  MoviesRepository repo;
  MovieDetailsCubit(this.repo) : super(MovieDetailsInitState());
  MovieResponse? movieResponse;
  MoviesResponse? movieSuggestions;
  static MovieDetailsCubit get(context)=> BlocProvider.of<MovieDetailsCubit>(context);

  getMovieById(int id) async {
    try {
      emit(MovieDetailsLoadingState());
      MovieResponse result= await repo.getMovieByID(id);
      movieResponse=result;
      await getMovieSuggestionsById(id);
      emit(MovieDetailsSuccessState());
    } catch (e) {
      emit(MovieDetailsErrorState());
    }

  }

  getMovieSuggestionsById(int id) async {
    try {
      emit(LoadingSuggestionsState());
      movieSuggestions=await repo.getMovieSuggestionsById(id);
      emit(SuccessSuggestionsState());
    } catch (e) {
      emit(ErrorSuggestionsState());
    }

  }
}