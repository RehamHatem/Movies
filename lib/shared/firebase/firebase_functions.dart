import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/home_models/TopRelatedResponse.dart';
import 'movie_model.dart';

class Firebasefunctions {

  static CollectionReference<Results> getAllmovies() {
    return  FirebaseFirestore.instance.collection("Movies").withConverter<Results>(
        fromFirestore: (snapshot, options) {
          return Results.fromJson(snapshot.data()!);
        }, toFirestore: (value, _) {
      return value.toJson();
    });
  }
  static Future<void> addmovie(Results movie) {
    var collection = getAllmovies();
    var docref = collection.doc();
    String mid=movie.id.toString();
    mid=docref.id;
    return docref.set(movie);
  }

  static Future<QuerySnapshot<Results>>getMovie() {
    return getAllmovies().get();
  }
  // static Future<void> deleteTask(String id) {
  //   return getAllmovies().doc(id).delete();
  // }

// static Future<void> updateTask(MovieModel model) {
//   return getmovie().doc(model.id).update(model.toJson());
// }
}