class MovieModel {
  static const String collectionName = "Movies";
  int? movieId;
  String id;
  String? title;
  bool addclick;

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel({
    this.id = '',
    required this.addclick,
    required this.movieId,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    this.video,
    required this.voteAverage,
    this.voteCount,
  });

  // MovieModel.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       addclick = json['check'],
  //       movieId = json['movieId'],
  //       adult = json['adult'],
  //       backdropPath = json['backdropPath'],
  //       genreIds = json['genreIds'] != null ? List<int>.from(json['genreIds']) : null,
  //       originalLanguage = json['originalLanguage'],
  //       originalTitle = json['originalTitle'],
  //       overview = json['overview'],
  //       popularity = json['popularity'],
  //       posterPath = json['posterPath'],
  //       releaseDate = json['releaseDate'],
  //       title = json['title'],
  //       video = json['video'],
  //       voteAverage = json['voteAverage'],
  //       voteCount = json['voteCount'];


  MovieModel.fromJson(Map<String, dynamic> data)
      : this(
    id: data['id'],
    addclick: data['check'],
    movieId: data['movieId'],
    adult: data['adult'],
    backdropPath: data['backdropPath'],
    genreIds: List<int>.from(data['genreIds']),
    originalLanguage: data['originalLanguage'],
    originalTitle: data['originalTitle'],
    overview: data['overview'],
    popularity: data['popularity'],
    posterPath: data['posterPath'],
    releaseDate: data['releaseDate'],
    title: data['title'],
    video: data['video'],
    voteAverage: data['voteAverage'],
    voteCount: data['voteCount'],
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      'movieId': movieId,
      'check': addclick,
      'adult': adult,
      'backdropPath': backdropPath,
      'genreIds': genreIds,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}
