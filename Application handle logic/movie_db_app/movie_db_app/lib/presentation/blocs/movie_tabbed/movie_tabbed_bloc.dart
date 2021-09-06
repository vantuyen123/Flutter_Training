import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/get_comingsoon.dart';
import 'package:movie_db_app/domain/usecase/get_playing_now.dart';
import 'package:movie_db_app/domain/usecase/get_popular.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_event.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({this.getComingSoon, this.getPlayingNow, this.getPopular})
      : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(MovieTabbedEvent event) async* {
    if (event is MovieTabChangedEvent) {
      yield MovieTabLoading(currentTabIndex: event.currentTabIndex);
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
      }
       yield moviesEither.fold(
          (l) => MovieTabLoadError(
                currentTabIndex: event.currentTabIndex,
                errorType: l.appErrorType,
              ), (movies) {
        return MovieTabChanged(
            currentTabIndex: event.currentTabIndex, movies: movies);
      });
    }
  }
}
