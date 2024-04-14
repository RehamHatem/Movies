
import 'package:flutter/material.dart';

import '../../models/browse_models/CategoriesResponse.dart';
import '../../models/home_models/ImagesResponce.dart';

class Category_item extends StatelessWidget {
  Genres gen;
  String image;
   Category_item({Key?key,required this.gen,required this.image}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children:[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill,opacity: .3)
            ),),
            Text(gen.name ?? "",style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),),

      ],



    ) ;
  }
}
