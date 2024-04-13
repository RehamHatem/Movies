import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/ImagesResponce.dart';
import '../../models/PopularResponse.dart';

class APImanager {
// https://api.themoviedb.org/3/movie/popular?language=en-US&page=1
  static Future<PopularResponse> getPopular() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/popular",
        {"apiKey": "eccc250523283057a0b4ff1fbdec6cf6","language":"en-US","page":"1"});
    http.Response resposne = await http.get(url,headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'
    },);
    Map<String, dynamic> json = jsonDecode(resposne.body);

    return PopularResponse.fromJson(json);
  }
//https://api.themoviedb.org/3/configuration
  static Future<ImagesResponce> getImages() async {
    Uri url =
    Uri.https("api.themoviedb.org", "/3/configuration",);
    var resposne = await http
        .get(url, headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlY2NjMjUwNTIzMjgzMDU3YTBiNGZmMWZiZGVjNmNmNiIsInN1YiI6IjY2MTk2ZGY2MTIxOTdlMDE2NGJiYjIyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPUNmzmmwTP1iRWP4y08m6_4TfXwpZYhushBNEq-qmQ'});

    var json = jsonDecode(resposne.body);
    print(json);
    return ImagesResponce.fromJson(json);
  }


}