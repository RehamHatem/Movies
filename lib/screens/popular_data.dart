import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/screens/popular_item.dart';

import '../shared/network/api.dart';

class PopData extends StatelessWidget {
  const PopData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:Future.wait([APImanager.getPopular(),APImanager.getImages()]),builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if(snapshot.hasError){
        return Text("something went wtong",style: TextStyle(color: Colors.white));
      }
      var popList=snapshot.data?[0].results?? [];
      var images = snapshot.data?[1].images??[];
      if(popList.isEmpty){
        return Center(child: Text("No Data",style: TextStyle(color: Colors.white)));
      }
      return PopItem(result: popList,images: images,);

    } );
  }
}
