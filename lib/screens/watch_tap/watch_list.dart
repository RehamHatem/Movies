import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/watch_tap/wach_item.dart';

import '../../shared/firebase/firebase_functions.dart';
import '../../shared/network/api.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
                future: Future.wait(
        [Firebasefunctions.getMovie(), APImanager.getImages()]),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Column(
          children: [
            Text("something went wrong"),
            ElevatedButton(onPressed: () {}, child: Text("try again"))
          ],
        );
      }
      print("---------------------------");
      print(snapshot.data?[0]);
      var movielist = snapshot.data?[0]??[] ;
      
      
      var images = snapshot.data?[1].images??[];
      
      if (movielist.isEmpty) {
        return Center(child: Text("No Watch List Movies",style: TextStyle(
          color: Colors.white,
        ),));
      }
      return WatchItem(
        images: images,
        movieModel: movielist,
      );
                },
              ),
    );
  }
}
