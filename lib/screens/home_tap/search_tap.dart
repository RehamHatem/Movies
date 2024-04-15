import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/screens/home_tap/searchResults.dart';
import 'package:movies_app/shared/network/api.dart';

import '../../models/home_models/SearchResponse.dart';

class Search_Tap extends StatefulWidget {
  Search_Tap({super.key});

  @override
  State<Search_Tap> createState() => _Search_TapState();
}

class _Search_TapState extends State<Search_Tap> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Color(0xff121312),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    onChanged: (value) {
                      searchText = _searchController.text;
                      setState(() {

                      });
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),

                      prefixIcon:Icon(

                          Icons.search,
                          color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Color(0xff514F4F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),

            SearchResults(q: '$searchText',),

            ],
          ),]
    )
    );


}
}
