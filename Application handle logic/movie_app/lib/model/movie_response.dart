import 'package:movie_app/model/movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((e) => new Movie.fromJson(e))
            .toList(),
        error = "";

  MovieResponse.withError(String errorValue)
      : movies = [],
        error = errorValue;
}
