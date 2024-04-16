import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/screens/search_tap/searchResults.dart';
import 'package:movies_app/shared/network/api.dart';

import '../../models/search_models/SearchResponse.dart';

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: TextField(
            onChanged: (value) {
              searchText = _searchController.text;
              setState(() {});

            },

            controller: _searchController,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(30)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(30)),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              filled: true,
              fillColor: Color(0xff514F4F),
            ),
          ),
        ),
        SearchResults(
          q: '$searchText',
        ),
      ],
    );
  }
}
