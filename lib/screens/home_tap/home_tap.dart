import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_tap/popular_data.dart';
import 'package:movies_app/screens/home_tap/upComing_data.dart';

import '../../shared/network/api.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Column(
          children: [
            PopData(),
            SizedBox(height: 20,),
            UpComData(),
        
          ],
        ),
      );
  }
}
