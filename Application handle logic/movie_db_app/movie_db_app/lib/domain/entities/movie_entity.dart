import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
        this.overview}) : assert(id != null,'Movie id must not be null');

  @override
  // TODO: implement props
  List<Object> get props => [id,title];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}
