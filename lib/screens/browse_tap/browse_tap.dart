import 'package:flutter/material.dart';

import 'browse_data.dart';

class BrowseTap extends StatelessWidget {
  const BrowseTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Padding(
        padding: const EdgeInsets.only(top: 16.0,left: 16,right: 16,bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Browse Category ",style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: Colors.white
            ),),
            SizedBox(height: 20,),
            CategoriesData()


          ],
        ),
      ),
    );
  }
}
