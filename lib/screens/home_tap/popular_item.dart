import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../layouts/home_layouts/movie_details.dart';
import '../../models/home_models/ImagesResponce.dart';
import '../../models/home_models/PopularResponse.dart';

class PopItem extends StatelessWidget {
  List<Results> result;
  Images images;

  PopItem({Key? key, required this.result, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 260,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: result.map((result) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {

                Navigator.pushNamed(context, MovieDetails.routeName,arguments: result.id);

              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 260,
                        decoration: BoxDecoration(color: Colors.transparent),
                      ),
                      Container(
                          width: double.infinity,
                          height: 190,
                          alignment: Alignment.center,
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //   image: NetworkImage(
                          //       "${images.baseUrl}original${result.backdropPath ?? ""}"),
                          //   fit: BoxFit.fill,
                          // )),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      "${images.baseUrl}original${result.backdropPath ?? ""}",
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
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            width: 100,
                            height: 170,
                            child: ClipRRect(
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                  "${images.baseUrl}original${result.posterPath ?? ""}",
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),

                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${result.title}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "${result.releaseDate}",
                                style: TextStyle(
                                  color: Color(0xffB5B4B4),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
