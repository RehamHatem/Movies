import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/ImagesResponce.dart';
import '../../models/TopRelatedResponse.dart';



class TopRelatedItem extends StatefulWidget {
  List<Results> topResults;
  Images images;

  TopRelatedItem({Key? key, required this.topResults, required this.images})
      : super(key: key);

  @override
  State<TopRelatedItem> createState() => _TopRelatedItemState();
}

class _TopRelatedItemState extends State<TopRelatedItem> {
  bool addClick = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff282A28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recomended ",
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
                return SingleChildScrollView(
                  child: Container(
                    height: 250,
                    width: 130,
                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: Color(0xff343534),
                    ),
                    child: Column(
                  
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              padding: EdgeInsets.zero,

                              child: ClipRRect(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,

                                  imageUrl: "${widget.images.baseUrl}original${widget.topResults[index].posterPath}",
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(
                              children: [
                                Icon(Icons.star,color: Color(0xffFFBB3B),),
                                SizedBox(width: 5,),
                                Text("${widget.topResults[index].voteAverage}",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10
                                ),),
                              ],
                            ),
                            Text("${widget.topResults[index].title}",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                            ),),
                            SizedBox(height: 5,),
                            Text("${widget.topResults[index].releaseDate}",style: TextStyle(
                              fontSize: 10,
                              color: Color(0xffB5B4B4),
                            ),)
                          ],),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: widget.topResults.length,
            ),
          ),
        ],
      ),
    );
  }
}
