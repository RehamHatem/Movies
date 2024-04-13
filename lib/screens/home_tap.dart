import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/popular_data.dart';

import '../shared/network/api.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Column(
          children: [
            PopData(),
        
          ],
        ),
      );
  }
}
