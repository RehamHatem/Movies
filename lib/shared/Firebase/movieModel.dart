class MovieModel {
  static const String collectionName = "Movies";
  int? movieId;
  String id;
  String? title;
  bool addclick;
  MovieModel(
      {this.id ='',required this.addclick,required this.movieId,required this.title,});

  MovieModel.fromJson(Map<String, dynamic> json)
      : this(
      title: json['title'],
      id: json['id'],
    addclick: json['check'],
    movieId: json['mId']
);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      'mId':movieId,
      'check':addclick
    };
  }
}

