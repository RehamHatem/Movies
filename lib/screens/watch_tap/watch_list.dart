import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/watch_tap/wach_item.dart';

import '../../models/home_models/ImagesResponce.dart';
import '../../shared/firebase/firebase_functions.dart';
import '../../shared/network/api.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
                stream: Firebasefunctions.getMovie().asyncMap((movieList) async {
                  var image = await APImanager.getImages();
                  var images = image.images;
                  return [movieList, images];
                }),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Column(
          children: [
            Center(child: Text("something went wrong",style: TextStyle(color: Colors.white),)),

          ],
        );
      }
      print("---------------------------");
      print(snapshot.data?[0]);
      var movielist = snapshot.data?[0]??[] ;
      
      
      var images = snapshot.data?[1]??[];
      
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
