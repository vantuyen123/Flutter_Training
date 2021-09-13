import 'package:equatable/equatable.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props {
    return [];
  }
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {
  final AppErrorType errorType;

  const MovieCarouselError(this.errorType);
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  MovieCarouselLoaded({this.movies, this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props {
    return [movies, defaultIndex];
  }
}
