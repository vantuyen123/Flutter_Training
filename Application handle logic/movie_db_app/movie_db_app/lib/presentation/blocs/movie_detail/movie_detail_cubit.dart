import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/usecase/get_movie_detail.dart';
import 'package:movie_db_app/presentation/blocs/cast/cast_cubit.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_cubit.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_cubit.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_state.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_cubit.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastCubit castCubit;
  final VideosCubit videosCubit;
  final FavoriteCubit favoriteCubit;
  final LoadingCubit loadingCubit;

  MovieDetailCubit({
    @required this.loadingCubit,
    @required this.getMovieDetail,
    @required this.castCubit,
    @required this.videosCubit,
    @required this.favoriteCubit,
  }) : super(MovieDetailInitial());

  void loadMovieDetail(int movieId) async {
    loadingCubit.show();
    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetail(
      MovieParams(movieId),
    );
    emit(
      eitherResponse.fold(
        (l) => MovieDetailError(),
        (r) => MovieDetailLoaded(r),
      ),
    );
    favoriteCubit.checkIfMovieFavorites(movieId);
    castCubit.loadCast(movieId);
    videosCubit.loadVideos(movieId);
    loadingCubit.hide();
  }


}
