import 'package:flutter/material.dart';
import 'package:movies_app/screens/search_tap/searchResults.dart';

import '../../screens/browse_tap/browse_tap.dart';
import '../../screens/home_tap/home_tap.dart';
import '../../screens/search_tap/search_tap.dart';
import '../../screens/watch_tap/watch_list.dart';
import '../../screens/watch_tap/watch_tap.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
backgroundColor: Color(0xff121312),
body: SafeArea(child: taps[index]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff1A1A1A),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: Color(0xffFFBB3B),
          unselectedItemColor: Colors.white,

          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {

            });
          },

          iconSize: 30,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Browse"),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark), label: "WatchList"),

          ]),
    );
  }
  List<Widget>taps=[
    HomeTap(),
    Search_Tap(),
    BrowseTap(),
    WatchTap(),
  ];
}
