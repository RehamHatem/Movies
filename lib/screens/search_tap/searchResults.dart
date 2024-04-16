import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/screens/search_tap/search_item.dart';


import '../../shared/network/api.dart';

class SearchResults extends StatelessWidget {
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
      var searchList=snapshot.data?[0].results?? [];
      var images = snapshot.data?[1].images??[];
      if(searchList.isEmpty){
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.local_movies_sharp,
                color: Colors.white,
                size: 150,
              ),
              Text(
                "No movies found",
                style: TextStyle(color: Colors.white),
              ),
          
            ],
          ),
        );
      }

      return search_item(images: images, result: searchList,) ;

    } );
  }
}