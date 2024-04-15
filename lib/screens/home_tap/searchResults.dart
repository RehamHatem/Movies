import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_tap/search_item.dart';

import '../../shared/network/api.dart';

class SearchResults extends StatelessWidget {
  static const String routeName="search";

  String q;
   SearchResults({super.key,required this.q});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:Future.wait([APImanager.getsearch(q),APImanager.getImages()]),builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if(snapshot.hasError){
        return Text("something went wtong",style: TextStyle(color: Colors.white));
      }
      var topList=snapshot.data?[0].results?? [];
      var images = snapshot.data?[1].images??[];
      if(topList.isEmpty){
        return Column(
          children: [
            SizedBox(height: 150,),
            Center(
                child: Icon(
                  Icons.local_movies_sharp,
                  color: Colors.white,
                  size: 150,
                )),
              Center(
                  child: Text(
                    "No movies found",
                    style: TextStyle(color: Colors.white),
                  )),
          ],
        );
      }
      return search_item(images: images, result: topList,) ;

    } );
  }
}