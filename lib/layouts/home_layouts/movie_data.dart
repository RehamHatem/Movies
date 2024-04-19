import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/layouts/home_layouts/samilar_item.dart';

import '../../models/home_models/MovieDetailsResponse.dart';
import '../../models/home_models/SimilarMoviesResponse.dart';
import '../../shared/firebase/firebase_functions.dart';
import '../../shared/firebase/movie_model.dart';
import '../../shared/network/api.dart';
import 'movie_details.dart';

class MovieData extends StatefulWidget {
  int movieId;

  MovieData({super.key, required this.movieId});

  @override
  State<MovieData> createState() => _MovieDataState();
}

class _MovieDataState extends State<MovieData> {
  bool addClick = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          APImanager.getMovieDetails(widget.movieId),
          APImanager.getImages(),
          APImanager.getSimilarMovies(widget.movieId)
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("something went wtong",
                style: TextStyle(color: Colors.white));
          }
          var movieDetails = snapshot.data?[0] as MovieDetailsResponse;
          var images = snapshot.data?[1].images ?? [];
          var sameMovie = snapshot.data?[2] as SimilarMoviesResponse;
          List<Results> samMovie = sameMovie.results ?? [];
          if (movieDetails == null) {
            return Center(
                child: Text("No Data", style: TextStyle(color: Colors.white)));
          }
          return Scaffold(
            backgroundColor: Color(0xff121312),
            appBar: AppBar(
              backgroundColor: Color(0xff1D1E1D),
              iconTheme: IconThemeData(color: Colors.white, size: 25),
              title: Text(movieDetails.title ?? "",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "${images.baseUrl}original${movieDetails.backdropPath ?? ""}",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Icon(
                        Icons.play_circle,
                        size: 50,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 10, bottom: 5, right: 16),
                    child: Text(
                      movieDetails.title ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    child: Text(
                      movieDetails.releaseDate ?? "",
                      style: TextStyle(
                        color: Color(0xffB5B4B4),
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              height: 210,
                              width: 130,
                              padding: EdgeInsets.zero,
                              child: ClipRRect(
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      "${images.baseUrl}original${movieDetails.posterPath??""}",
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  addClick = !addClick;
                                  if(addClick==true){
                                    MovieModel movieModel = MovieModel(
                                      addclick: addClick,

                                      movieId:movieDetails.id,
                                      title: movieDetails.title,
                                      posterPath: movieDetails.posterPath,
                                      releaseDate: movieDetails.releaseDate,
                                      voteAverage: movieDetails.voteAverage,
                                      backdropPath: movieDetails.backdropPath,
                                      overview: movieDetails.overview,
                                      adult: movieDetails.adult,
                                      originalLanguage: movieDetails.originalLanguage,
                                      originalTitle: movieDetails.originalTitle,
                                      popularity: movieDetails.popularity,
                                      video: movieDetails.video,
                                      voteCount: movieDetails.voteCount,
                                    );

                                    Firebasefunctions.addmovie(movieModel);
                                    print("Movie Model: $movieModel");
                                  }


                                });
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: movieDetails.genres?.map((genre) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0,bottom: 5),
                                          child: Container(
                                            width: 65,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xffCBCBCB)),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              genre.name ?? "",
                                              style: TextStyle(
                                                  color: Color(0xffCBCBCB),
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.w400),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        );
                                      }).toList() ?? [],
                                ),
                                SizedBox(height: 15),
                                Text(
                                  movieDetails.overview ?? "",
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFBB3B),
                                      size: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Text("${movieDetails.voteAverage ?? 0}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SamilarItem(images: images,samMovie: samMovie,)
                ],
              ),
            ),
          );
        });
  }
}
