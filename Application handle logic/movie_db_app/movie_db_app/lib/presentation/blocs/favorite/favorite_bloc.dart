import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/check_if_movie_favorite.dart';
import 'package:movie_db_app/domain/usecase/delete_favorite_movies.dart';
import 'package:movie_db_app/domain/usecase/get_favorite_movies.dart';
import 'package:movie_db_app/domain/usecase/save_movie.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_event.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfMovieFavorite;

  FavoriteBloc(
      {@required this.saveMovie,
      @required this.getFavoriteMovies,
      @required this.deleteFavoriteMovie,
      @required this.checkIfMovieFavorite})
      : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is ToggleFavoriteMovieEvent) {
      if (event.isFavorite) {
        await deleteFavoriteMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveMovie(event.movieEntity);
      }
      final response =
          await checkIfMovieFavorite(MovieParams(event.movieEntity.id));
      yield response.fold(
        (l) => FavoriteMoviesError(),
        (r) => IsFavoriteMovie(r),
      );
    } else if (event is LoadFavoriteMovieEvent) {
      yield* _fetchLoadFavoriteMovies();
    } else if (event is DeleteFavoriteMovieEvent) {
      await deleteFavoriteMovie(MovieParams(event.movieId));
      yield* _fetchLoadFavoriteMovies();
    } else if (event is CheckIfFavoriteMovieEvent) {
      final response = await checkIfMovieFavorite(MovieParams(event.movieId));
      yield response.fold(
        (l) => FavoriteMoviesError(),
        (r) => IsFavoriteMovie(r),
      );
    }
  }

  Stream<FavoriteState> _fetchLoadFavoriteMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovies(NoParams());
    yield response.fold(
      (l) => FavoriteMoviesError(),
      (r) => FavoriteMoviesLoaded(r),
    );
  }
}
