import 'package:flutter/material.dart';
import 'package:movies_app/models/browse_models/CategoriesResponse.dart';

import '../../shared/network/api.dart';
import 'genre_item.dart';

class GenreData extends StatelessWidget {
  static const String routeName="genre";
   GenreData({super.key});
  @override
  Widget build(BuildContext context) {
    var obj=ModalRoute.of(context)!.settings.arguments as Genres;
    var id=obj.id ;
    var name=obj.name;

    return FutureBuilder(future:Future.wait([APImanager.getGenre(id.toString()),APImanager.getImages()]),builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if(snapshot.hasError){
        return Text("something went wtong",style: TextStyle(color: Colors.white));
      }
      var genreList=snapshot.data?[0].results?? [];
      var images = snapshot.data?[1].images??[];
      if(genreList.isEmpty){
        return Center(child: Text("No Data",style: TextStyle(color: Colors.white)));
      }
      return Scaffold(
        backgroundColor: Color(0xff121312),
        appBar: AppBar(
          backgroundColor: Color(0xff1D1E1D),
          iconTheme: IconThemeData(color: Colors.white, size: 25),
          title: Text(name ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400)),
        ),
        body: GenreItem(genresult: genreList,images: images,),
      ) ;

    } );
  }
}
