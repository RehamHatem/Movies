import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/ImagesResponce.dart';
import '../../models/PopularResponse.dart';

class PopItem extends StatelessWidget {
  List<Results> result;
  Images images;

  PopItem({Key? key, required this.result, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 289,  autoPlay: true,enlargeCenterPage: true,),
      items: result.map((result) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 289,
                      decoration: BoxDecoration(color: Colors.transparent),
                    ),
                    Container(
                        width: double.infinity,
                        height: 217,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(

                            image: DecorationImage(
                          image: NetworkImage("${images.baseUrl}original${result.backdropPath ?? ""}"),

                          fit: BoxFit.fill,

                        )),
                        child: Icon(
                          Icons.play_circle,
                          size: 50,
                          color: Colors.white,
                        )),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          width: 129,
                          height: 199,
                          child: Image(
                            image: NetworkImage(
                                "${images.baseUrl}original${result.posterPath ?? ""}"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${result.title}",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:GoogleFonts.inter(
                                color: Colors.white,
                                fontSize:15,




                              ),
                            ),
                            Text("${result.releaseDate}",style: GoogleFonts.inter(
                              color: Color(0xffB5B4B4),
                            ),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
