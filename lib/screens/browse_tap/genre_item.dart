import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/browse_models/GenreResponse.dart';

import '../../layouts/home_layouts/movie_details.dart';
import '../../models/home_models/ImagesResponce.dart';
import '../../shared/firebase/firebase_functions.dart';
import '../../shared/firebase/movie_model.dart';

class GenreItem extends StatefulWidget {
 List<Results>  genresult;
  Images images;
   GenreItem({super.key,required this.genresult,required this.images});

  @override
  State<GenreItem> createState() => _GenreItemState();
}

class _GenreItemState extends State<GenreItem> {
  List<bool> addClick = [];
  void initState() {
    super.initState();
    addClick = List.filled(widget.genresult.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Color(0xff707070),);
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetails.routeName,arguments: widget.genresult[index].id);

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

                                imageUrl: "${widget.images.baseUrl}original${widget.genresult[index].backdropPath}",
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                addClick[index] = !addClick[index];
                                if(addClick[index]==true){
                                  MovieModel movieModel = MovieModel(
                                    addclick: addClick[index],
                                    movieId: widget.genresult[index].id,
                                    title: widget.genresult[index].title,
                                    posterPath: widget.genresult[index].posterPath,
                                    releaseDate: widget.genresult[index].releaseDate,
                                    voteAverage: widget.genresult[index].voteAverage,
                                    genreIds: widget.genresult[index].genreIds,
                                    backdropPath: widget.genresult[index].backdropPath,
                                    overview: widget.genresult[index].overview,
                                    adult: widget.genresult[index].adult,
                                    originalLanguage: widget.genresult[index].originalLanguage,
                                    originalTitle: widget.genresult[index].originalTitle,
                                    popularity: widget.genresult[index].popularity,
                                    video: widget.genresult[index].video,
                                    voteCount: widget.genresult[index].voteCount,
                                  );

                                  Firebasefunctions.addmovie(movieModel);

                                }

                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.bookmark_outlined,
                                  color: addClick[index]
                                      ? Color(0xffF7B539)
                                      : Color(0xff514F4F),
                                  size: 50,
                                ),
                                Icon(
                                  addClick[index] ? Icons.check : Icons.add,
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
                            Text(widget.genresult[index].title??"",style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 15,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 10,),
                            Text(widget.genresult[index].releaseDate??"",style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 5,),

                            Row(
                              children: [
                                Icon(Icons.star,color: Color(0xffFFBB3B),size: 30,),
                                SizedBox(width: 5,),
                                Text("${widget.genresult[index].voteAverage}",style: TextStyle(fontWeight: FontWeight.w400,
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
        itemCount: widget.genresult.length,

      ),
    );
  }
}
