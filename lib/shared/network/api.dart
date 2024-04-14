import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/browse_models/CategoriesResponse.dart';
import '../../models/browse_models/GenreResponse.dart';
import '../../models/home_models/ImagesResponce.dart';
import '../../models/home_models/MovieDetailsResponse.dart';
import '../../models/home_models/PopularResponse.dart';
import '../../models/home_models/SimilarMoviesResponse.dart';
import '../../models/home_models/TopRelatedResponse.dart';
import '../../models/home_models/UpComingResponse.dart';

class APImanager {
// https://api.themoviedb.org/3/movie/popular?language=en-US&page=1
  static Future<PopularResponse> getPopular() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/popular", {
      "apiKey": "eccc250523283057a0b4ff1fbdec6cf6",
      "language": "en-US",
      "page": "1"
    });
    http.Response resposne = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
      },
    );
    Map<String, dynamic> json = jsonDecode(resposne.body);

    return PopularResponse.fromJson(json);
  }

//https://api.themoviedb.org/3/configuration
  static Future<ImagesResponce> getImages() async {
    Uri url = Uri.https(
      "api.themoviedb.org",
      "/3/configuration",
    );
    var resposne = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
    });

    var json = jsonDecode(resposne.body);

    return ImagesResponce.fromJson(json);
  }

  //https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1
  static Future<UpComingResponse> getUpComing() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/upcoming",
        {"language": "en", "page": "1"});
    var resposne = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
    });

    var json = jsonDecode(resposne.body);
    return UpComingResponse.fromJson(json);
  }


  //https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1
  static Future<TopRelatedResponse> getTopRelated() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/top_rated",
        {"language": "en-US", "page": "1"});
    var resposne = await http.get(url, headers: {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
    });

    var json = jsonDecode(resposne.body);
    print(json);
    return TopRelatedResponse.fromJson(json);
  }

//https://api.themoviedb.org/3/movie/278?language=en-US
  static Future<MovieDetailsResponse> getMovieDetails(int id) async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/$id",
        {"language": "en-US" });
    var resposne = await http.get(url, headers: {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
    });

    var json = jsonDecode(resposne.body);
    return MovieDetailsResponse.fromJson(json);
  }
//https://api.themoviedb.org/3/movie/278/similar?language=en-US&page=1
  static Future<SimilarMoviesResponse> getSimilarMovies(int id) async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/$id/similar",
        {"language": "en-US","page":"1" });
    var resposne = await http.get(url, headers: {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
    });

    var json = jsonDecode(resposne.body);
    return SimilarMoviesResponse.fromJson(json);
  }
//https://api.themoviedb.org/3/genre/movie/list?language=en
  static Future<CategoriesResponse> getCategories() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/genre/movie/list",
        {"language": "en" });
    var resposne = await http.get(url, headers: {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
    });

    var json = jsonDecode(resposne.body);
    return CategoriesResponse.fromJson(json);
  }

//https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc
  static Future<GenreResponse> getGenre(String id) async {
    Uri url = Uri.https("api.themoviedb.org", "/3/discover/movie",
        {"language": "en","page":"1" ,"with_genres":id,"sort_by":"popularity.desc"});
    var resposne = await http.get(url, headers: {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
    });
    var json = jsonDecode(resposne.body);
    return GenreResponse.fromJson(json);
  }
}
