import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../layouts/home_layouts/movie_details.dart';
import '../../models/home_models/ImagesResponce.dart';
import '../../models/home_models/UpComingResponse.dart';

class UpComItem extends StatefulWidget {
  List<Results> upResults;
  Images images;

  UpComItem({Key? key, required this.upResults, required this.images})
      : super(key: key);

  @override
  State<UpComItem> createState() => _UpComItemState();
}

class _UpComItemState extends State<UpComItem> {
  bool addClick = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 187,
      padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff282A28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Releases ",
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight:FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10,
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pushNamed(context, MovieDetails.routeName,arguments: widget.upResults[index].id);
                      },
                      child: Container(
                        height: 127,
                        width: 96,
                        padding: EdgeInsets.zero,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),

                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: "${widget.images.baseUrl}original${widget.upResults[index].posterPath}",
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        addClick = !addClick;
                        setState(() {});
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
                );
              },
              itemCount: widget.upResults.length,
            ),
          ),
        ],
      ),
    );
  }
}
