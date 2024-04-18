import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/firebase/firebase_functions.dart';
import '../../layouts/home_layouts/movie_details.dart';
import '../../models/home_models/ImagesResponce.dart';
import '../../shared/firebase/movie_model.dart';


class WatchItem extends StatefulWidget {
  List<MovieModel> movieModel;

  WatchItem({super.key, required this.movieModel,required this.images});
  Images images;

  @override
  State<WatchItem> createState() => _WatchItemState();
}

class _WatchItemState extends State<WatchItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Color(0xff707070),);
      },
     itemBuilder: (context, index) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MovieDetails.routeName,arguments:widget.movieModel[index].movieId );
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

                          imageUrl: "${widget.images.baseUrl}original${widget.movieModel[index].posterPath}",                                      placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),),
                    ),
                    InkWell(
                      onTap: () {
                        Firebasefunctions.deleteMovie(widget.movieModel[index].id);
                        setState(() {
                          Firebasefunctions.getMovie();

                        });

                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_outlined,
                            color: Color(0xffF7B539),
                            size: 50,
                          ),
                          Icon(
                            Icons.check ,
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
                      Text(widget.movieModel[index].title ?? "",style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 15,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      Text(widget.movieModel[index].releaseDate??"",style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 13,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Icon(Icons.star,color: Color(0xffFFBB3B),size: 30,),
                          SizedBox(width: 5,),
                          Text("${widget.movieModel[index].voteAverage}" ,style: TextStyle(fontWeight: FontWeight.w400,
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
      );

     },
      itemCount: widget.movieModel.length,
    );

  }
}