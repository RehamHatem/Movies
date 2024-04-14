import 'package:flutter/material.dart';
import 'package:movies_app/models/MovieDetailsResponse.dart';

import 'movie_data.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName="details";
 MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var movie=ModalRoute.of(context)!.settings.arguments as int  ;

    return MovieData(movieId: movie,);

  }
}
