import 'package:flutter/material.dart';
import 'package:movies_app/models/home_models/MovieDetailsResponse.dart';

import '../../models/browse_models/CategoriesResponse.dart';
import '../../shared/network/api.dart';
import 'browse_item.dart';

class CategoriesData extends StatelessWidget {
  const CategoriesData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:Future.wait([APImanager.getCategories(),APImanager.getImages()]),builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if(snapshot.hasError){
        return Text("something went wtong",style: TextStyle(color: Colors.white));
      }
      var catList = snapshot.data?[0] .genres ??[];
      List<String>images=[
        "assets/images/action.png",
        "assets/images/advanture.png",
        "assets/images/animation.png",
        "assets/images/any.png",
        "assets/images/horro.png",
        "assets/images/any.png",
        "assets/images/any.png",
        "assets/images/any.png",
        "assets/images/horro.png",
        "assets/images/horro.png",
        "assets/images/horro.png",
        "assets/images/romance.png",
        "assets/images/romance.png",
        "assets/images/romance.png",
        "assets/images/romance.png",
        "assets/images/horro.png",
        "assets/images/horro.png",
        "assets/images/romance.png",
        "assets/images/any.png",


      ];
      if(catList.isEmpty){
        return Center(child: Text("No Data",style: TextStyle(color: Colors.white)));
      }
      return Expanded(
        child: GridView.builder(
          itemBuilder: (context, index) {
            return Category_item(
              gen: catList[index],
              image: images[index],
            );
          },
          itemCount: catList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        ),
      );

    } );
  }
}
