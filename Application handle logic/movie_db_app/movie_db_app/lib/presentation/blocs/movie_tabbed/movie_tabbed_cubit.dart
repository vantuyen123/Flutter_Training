import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/get_comingsoon.dart';
import 'package:movie_db_app/domain/usecase/get_playing_now.dart';
import 'package:movie_db_app/domain/usecase/get_popular.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_state.dart';

class MovieTabbedCubit extends Cubit<MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedCubit({this.getComingSoon, this.getPlayingNow, this.getPopular})
      : super(MovieTabbedInitial());

  void movieTabChanged({int currentTabIndex = 0}) async {
    emit(MovieTabLoading(currentTabIndex: currentTabIndex));
    Either<AppError, List<MovieEntity>> movieEither;
    switch (currentTabIndex) {
      case 0:
        movieEither = await getPopular(NoParams());
        break;
      case 1:
        movieEither = await getPlayingNow(NoParams());
        break;
      case 2:
        movieEither = await getComingSoon(NoParams());
        break;
    }
    emit(
      movieEither.fold(
          (l) => MovieTabLoadError(
              errorType: l.appErrorType,
              currentTabIndex: currentTabIndex), (movies) {
        return MovieTabChanged(
            currentTabIndex: currentTabIndex, movies: movies);
      }),
    );
  }
}
