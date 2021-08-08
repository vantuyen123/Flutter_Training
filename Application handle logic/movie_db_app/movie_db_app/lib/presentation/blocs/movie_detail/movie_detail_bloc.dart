import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/usecase/get_movie_detail.dart';
import 'package:movie_db_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_event.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_cubit.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_event.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_state.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_event.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastCubit castBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;
  final LoadingCubit loadingCubit;
  MovieDetailBloc( {
    @required this.loadingCubit,
    @required this.getMovieDetail,
    @required this.castBloc,
    @required this.videosBloc,
    @required this.favoriteBloc,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async* {
    if (event is MovieDetailLoadEvent) {
      loadingCubit.show();
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(MovieParams(event.movieId));
      yield eitherResponse.fold(
        (l) => MovieDetailError(),
        (r) => MovieDetailLoaded(r),
      );
      favoriteBloc.add(CheckIfFavoriteMovieEvent(event.movieId));

      castBloc.loadCast(event.movieId);
      videosBloc.add(LoadVideoEvent(event.movieId));
      loadingCubit.hide();
    }
  }
}
