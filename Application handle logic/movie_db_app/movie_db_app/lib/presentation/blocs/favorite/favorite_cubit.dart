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
import 'package:movie_db_app/presentation/blocs/favorite/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfMovieFavorite;

  FavoriteCubit(
      {@required this.saveMovie,
      @required this.getFavoriteMovies,
      @required this.deleteFavoriteMovie,
      @required this.checkIfMovieFavorite})
      : super(FavoriteInitial());

  void toggleFavoriteMovie(MovieEntity movieEntity, bool isFavorite) async {
    if (isFavorite) {
      await deleteFavoriteMovie(MovieParams(movieEntity.id));
    } else {
      await saveMovie(movieEntity);
    }
    final response = await checkIfMovieFavorite(MovieParams(movieEntity.id));
    emit(
      response.fold(
        (l) => FavoriteMoviesError(),
        (r) => IsFavoriteMovie(r),
      ),
    );
  }

  void loadFavoriteMovie() async {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovies(NoParams());
    emit(
      response.fold(
        (l) => FavoriteMoviesError(),
        (r) => FavoriteMoviesLoaded(r),
      ),
    );
  }

  void deleteMovie(int movieId) async {
    await deleteFavoriteMovie(MovieParams(movieId));
    loadFavoriteMovie();
  }

  void checkIfMovieFavorites(int movieId) async {
    final response = await checkIfMovieFavorite(MovieParams(movieId));
    emit(response.fold(
          (l) => FavoriteMoviesError(),
          (r) => IsFavoriteMovie(r),
    ));
  }


}
