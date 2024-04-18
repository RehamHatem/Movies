import 'package:cloud_firestore/cloud_firestore.dart';
import 'movie_model.dart';

class Firebasefunctions {

  static CollectionReference<MovieModel> getAllmovies() {
    return FirebaseFirestore.instance.collection("Movies").withConverter<MovieModel>(
        fromFirestore: (snapshot, _) {
          return MovieModel.fromJson(snapshot.data()!);
        }, toFirestore: (value, _) {
      return value.toJson();
    });
  }

  static Future<void> addmovie(MovieModel movie) {
    var collection = getAllmovies();
    var docref = collection.doc();
    movie.id = docref.id;
    return docref.set(movie);
  }


  static Future<List<MovieModel>> getMovie() async {
    QuerySnapshot<MovieModel> querySnapshot = await getAllmovies().get();
    return querySnapshot.docs.map((doc) => doc.data()).toList() ;
  }


  // static Future<void> deleteTask(String id) {
  //   return getAllmovies().doc(id).delete();
  // }

// static Future<void> updateTask(MovieModel model) {
//   return getmovie().doc(model.id).update(model.toJson());
// }
}