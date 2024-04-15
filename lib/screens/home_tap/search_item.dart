

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../layouts/home_layouts/movie_details.dart';
import '../../models/home_models/SearchResponse.dart';
import '../../models/home_models/ImagesResponce.dart';

class search_item extends StatefulWidget {
  List<Results> result;
  Images images;

  search_item({Key? key, required this.result, required this.images})
      : super(key: key);

  @override
  State<search_item> createState() => _search_itemState();
}

class _search_itemState extends State<search_item> {
  bool addClick = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(color: Color(0xff707070),);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MovieDetails.routeName,arguments:widget.result[index].id );

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

                                  child: ClipRRect(
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,

                                      imageUrl: "${widget.images.baseUrl}original${widget.result[index].posterPath}",                                      placeholder: (context, url) => CircularProgressIndicator(),
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
                                  Text("${widget.result[index].title}",style: TextStyle(fontWeight: FontWeight.w400,
                                      fontSize: 15,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 10,),
                                  Text("${widget.result[index].releaseDate}",style: TextStyle(fontWeight: FontWeight.w400,
                                      fontSize: 13,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Color(0xffFFBB3B),size: 30,),
                                      SizedBox(width: 5,),
                                      Text("${widget.result[index].voteAverage}",style: TextStyle(fontWeight: FontWeight.w400,
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
              },
              itemCount: widget.result.length,

            ),


    );
  }
}
