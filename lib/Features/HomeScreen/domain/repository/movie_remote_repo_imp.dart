
import 'package:movie_app/Features/HomeScreen/domain/repository/repo.dart';

import '../../../../Core/APIs/api_manager.dart';
import '../../../../Core/APIs/endpoints.dart';
import '../../../../Core/Models/MovieParentalGuidesResponse.dart';
import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Models/movie_model.dart';



class MoviesRemoteRepository implements MoviesRepository{
  ApiManager api=ApiManager();

  /////////// List_Movies
  //search_movies ✅
  Future<MoviesResponse> searchMovies(String movieName) async {
    try {
      var response = await api.getApi(Endpoints.listMoviesEndpoint, params: {
        "query_term": movieName
      });
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    }catch(e){
      rethrow;
    }
  }

  //browse_movies
  Future<MoviesResponse> listMoviesByGenre(String genre) async {
    try{
    var response=await api.getApi(Endpoints.listMoviesEndpoint,params: {
      "genre":genre
    });
    MoviesResponse result= MoviesResponse.fromJson(response.data);
    return result;
    }catch(e){
      rethrow;
    }
  }
  //recent_movies
  Future<MoviesResponse> getRecentMovies() async {
    try {
      var response = await api.getApi(Endpoints.listMoviesEndpoint, params: {
        "sort_by": "year",
        "order_by": "desc",
        "limit": 10
      });
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    }catch(e){
      rethrow;
    }
  }



  /////////// Movie_Details
  //get_Movie_by_id✅
  Future<MovieResponse> getMovieByID(int id) async {
    try {
      var response = await api.getApi(Endpoints.movieDetailsEndpoint,
          params: {
            "movie_id": id,
            "with_images": true,
            "with_cast": true
          }
      );
      MovieResponse result = MovieResponse.fromJson(response.data);
      return result;
    }catch(e){
      rethrow;
    }
  }
  //list_of_movies
  Future<List<MovieResponse>> getMoviesById(List<int> ids) async {
    try {
      List<MovieResponse> result = [];
      for (int i = 0; i < ids.length; i++) {
        var response = await api.getApi(Endpoints.movieDetailsEndpoint,
            params: {
              "movie_id": ids[i],
              "with_images": true,
              "with_cast": true
            }
        );
        result.add(MovieResponse.fromJson(response.data));
      }
      return result;
    }
    catch(e){
      rethrow;
    }
  }
  /////////// Movie_Suggestions ✅
  Future<MoviesResponse> getMovieSuggestionsById(int id) async {
    try {
      var response = await api.getApi(Endpoints.movieSuggestionsEndpoint,
          params: {
            "movie_id": id
          }
      );
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    }catch(e){
      rethrow;
    }
  }

  /////////// Movie_Parental_Guides
  Future<MovieParentalGuidesResponse> getMovieParentalGuidesById(int id) async {
    try {
      var response = await api.getApi(Endpoints.movieParentalGuidesEndpoint,
          params: {
            "movie_id": id
          }
      );
      MovieParentalGuidesResponse result = MovieParentalGuidesResponse.fromJson(
          response.data);
      return result;
    }catch(e){
      rethrow;
    }
  }

}