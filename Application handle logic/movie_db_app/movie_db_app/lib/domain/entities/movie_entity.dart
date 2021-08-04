import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAvergare;
  final String releaseDate;
  final String overview;

  MovieEntity(
      {@required this.posterPath,
      @required this.id,
      @required this.backdropPath,
      @required this.title,
      @required this.voteAvergare,
      @required this.releaseDate,
        this.overview, voteAverage
      })
      : assert(id != null, 'Movie id must not be null');

  @override
  // TODO: implement props
  List<Object> get props => [id, title];

  @override
  // TODO: implement stringify
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      posterPath: movieDetailEntity.posterPath,
      id: movieDetailEntity.id,
      backdropPath: movieDetailEntity.backdropPath,
      title: movieDetailEntity.title,
      voteAvergare: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
    );
  }
}
