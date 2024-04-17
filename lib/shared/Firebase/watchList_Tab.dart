import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/Firebase/Watch_item.dart';
import 'package:movies_app/shared/Firebase/movieModel.dart';

import 'firebase_functions.dart';

class watchList extends StatelessWidget {
  const watchList({super.key});

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
            future: Firebasefunctions.getMovie(),
            builder: (context, snapshot) {
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
              List<MovieModel>movielist =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (movielist.isEmpty) {
                return Center(child: Text("No movies "));
              }
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return watchItem(movieModel: movielist[index],);
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
