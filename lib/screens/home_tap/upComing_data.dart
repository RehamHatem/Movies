import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_tap/upComing_item.dart';

import '../../shared/network/api.dart';

class UpComData extends StatelessWidget {
  const UpComData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:Future.wait([APImanager.getUpComing(),APImanager.getImages()]),builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if(snapshot.hasError){
        return Text("something went wtong",style: TextStyle(color: Colors.white));
      }
      var upList=snapshot.data?[0].results?? [];
      var images = snapshot.data?[1].images??[];
      if(upList.isEmpty){
        return Center(child: Text("No Data",style: TextStyle(color: Colors.white)));
      }
      return UpComItem(upResults: upList,images: images,) ;

    } );
  }
}
