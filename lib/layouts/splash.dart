import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_layouts/home.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(
    );
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      body: Stack(
        alignment: Alignment.center,

        children: [
          Center(child: Image.asset("assets/images/splash.png")),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Route",style: GoogleFonts.poppins(
                  color: Color(0xffFFBB3B),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )),
                Text("supervised by Mohamed Hamouda",style: GoogleFonts.poppins(
                  color: Color(0xffFFBB3B),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )),
              ],
            ),
          )
        ],
      ),

    );
  }
}
