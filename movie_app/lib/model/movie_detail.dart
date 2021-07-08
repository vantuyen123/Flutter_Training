import 'package:movie_app/model/genre.dart';

class MovieDetail {
  bool adult;
  int budget;
  List<Genre> genres;
  int id;
  String releaseDate;
  int runtime;

  MovieDetail(
    this.adult,
    this.budget,
    this.genres,
    this.id,
    this.releaseDate,
    this.runtime,
  );

  MovieDetail.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    budget = json['budget'];
    // if (json['genres'] != null) {
    //   genres = [];
    //   json['genres'].forEach((v) {
    //     genres.add(new Genre.fromJson(v));
    //   });
    // }
    genres =
        (json['genres'] as List).map((e) => new Genre.fromJson(e)).toList();
    id = json['id'];
    releaseDate = json['release_date'];
    runtime = json['runtime'];
  }
}
