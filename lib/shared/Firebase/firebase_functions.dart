import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/shared/Firebase/movieModel.dart';

class Firebasefunctions {

  static CollectionReference<MovieModel> getAllmovies() {
    return  FirebaseFirestore.instance.collection("movies").withConverter<MovieModel>(
        fromFirestore: (snapshot, options) {
          return MovieModel.fromJson(snapshot.data()!);
        }, toFirestore: (value, _) {
      return value.toJson();
    });
  }
  static Future<void> addmovie(MovieModel movie) {
    var collection = getAllmovies();
    var docref = collection.doc();
    movie.id=docref.id;
    return docref.set(movie);
  }

  static Future<QuerySnapshot<MovieModel>>getMovie() {
    return getAllmovies().get();
  }
  static Future<void> deleteTask(String id) {
    return getAllmovies().doc(id).delete();
  }

  // static Future<void> updateTask(MovieModel model) {
  //   return getmovie().doc(model.id).update(model.toJson());
  // }
}

