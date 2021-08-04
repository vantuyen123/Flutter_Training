import 'package:equatable/equatable.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteMoviesError extends FavoriteState {}

class IsFavoriteMovie extends FavoriteState {
  final bool isMovieFavorite;

  IsFavoriteMovie(this.isMovieFavorite);

  @override
  // TODO: implement props
  List<Object> get props => [isMovieFavorite];
}

class FavoriteMoviesLoaded extends FavoriteState {
  final List<MovieEntity> movies;

  FavoriteMoviesLoaded(this.movies);

  @override
  // TODO: implement props
  List<Object> get props => [movies];
}
