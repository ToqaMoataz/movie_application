import 'package:movie_app/Features/HomeScreen/domain/movie%20repository/repo.dart';
import 'package:movie_app/Features/moviesDetails/domain/movie_details_repo.dart';
import '../../../../Core/APIs/api_manager.dart';
import '../../../../Core/APIs/endpoints.dart';
import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Models/movie_model.dart';



class MoviesRemoteRepository implements MoviesRepository{
  ApiManager api=ApiManager();
  MovieDetailsRepo repo=MovieDetailsRepoImp();

  /////////// List_Movies
  //search_movies ✅
  @override
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
  @override
  Future<MoviesResponse> listMoviesByGenre(String genre) async {
    try {
      var response = await api.getApi(
        Endpoints.listMoviesEndpoint,
        params: {
          "genre": genre,
        },
      );
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    } catch (e) {
      rethrow;
    }
  }
  //browse_movies
  @override
  Future<MoviesResponse> listLimitMoviesByGenre(String genre,int limit) async {
    try {
      var response = await api.getApi(
        Endpoints.listMoviesEndpoint,
        params: {
          "genre": genre,
          "limit": limit,
        },
      );
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    } catch (e) {
      rethrow;
    }
  }


  //recent_movies
  @override
  Future<MoviesResponse> getRecentMovies() async {
    try {
      var response = await api.getApi(Endpoints.listMoviesEndpoint, params: {
        "sort_by": "year",
        "order_by": "desc",
        "limit": 10,
      });
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    }catch(e){
      rethrow;
    }
  }



  /////////// Movie_Details
  //list_of_movies
  Future<List<MovieResponse>> getMoviesByIDs(List<int> ids) async {
    try {

      final responses = await Future.wait(
        ids.map((id) => repo.getMovieByID(id)),
      );

      return responses;
    } catch (e) {
      rethrow;
    }
  }


  /////////// Movie_Suggestions ✅ to be removed
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



}