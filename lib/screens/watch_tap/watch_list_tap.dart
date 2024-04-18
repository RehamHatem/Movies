import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/watch_tap/wach_item.dart';

import '../../models/home_models/ImagesResponce.dart';
import '../../models/home_models/TopRelatedResponse.dart';
import '../../shared/Firebase/firebase_functions.dart';
import '../../shared/firebase/movie_model.dart';
import '../../shared/network/api.dart';


class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Padding(
          padding: const EdgeInsets.only(top: 16.0,left: 16,right: 16,bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Watchlist",style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.white
              ),),
              SizedBox(height: 20,),

              Expanded(
                  child: FutureBuilder(
                    future: Future.wait([Firebasefunctions.getMovie(),APImanager.getImages()]),
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
                      var images=snapshot.data![1];
                      List<Results>movielist = snapshot.data?[0].docs.map((e) => e.data()).toList() ?? [] ;
                      if (movielist.isEmpty) {
                        return Center(child: Text("No movies "));
                      }
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return watchItem(images:images ,movieModel:movielist [index],);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: movielist.length);
                    },
                  ))
            ],
          ),)
    );
  }
}