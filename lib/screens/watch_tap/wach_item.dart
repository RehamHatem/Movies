import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../layouts/home_layouts/movie_details.dart';
import '../../models/home_models/ImagesResponce.dart';
import '../../models/home_models/TopRelatedResponse.dart';
import '../../shared/firebase/movie_model.dart';


class watchItem extends StatelessWidget {
  Results movieModel;

  watchItem({super.key, required this.movieModel,required this.images});
  Images images;
  bool addClick = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MovieDetails.routeName,arguments:movieModel.id);
            },
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                        height: 90,
                        width: 140,
                        padding: EdgeInsets.zero,
                        child:
                      ClipRRect(
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,

                          imageUrl: "${images.baseUrl}original${movieModel.posterPath}",                                      placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),),
                    ),
                    InkWell(
                      onTap: () {
                        addClick = !addClick;
                        // setState(() {});
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_outlined,
                            color: addClick
                                ? Color(0xffF7B539)
                                : Color(0xff514F4F),
                            size: 50,
                          ),
                          Icon(
                            addClick ? Icons.check : Icons.add,
                            size: 20,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movieModel.title ?? "",style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 15,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      Text(movieModel.releaseDate??"",style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 13,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Icon(Icons.star,color: Color(0xffFFBB3B),size: 30,),
                          SizedBox(width: 5,),
                          Text(movieModel.voteAverage as String,style: TextStyle(fontWeight: FontWeight.w400,
                              fontSize: 13,color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );

  }
}