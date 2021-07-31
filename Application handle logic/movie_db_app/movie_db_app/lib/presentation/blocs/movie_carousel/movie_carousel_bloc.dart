import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/get_trending.dart';
import 'package:movie_db_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';
import 'package:movie_db_app/presentation/blocs/movie_carousel/movie_carousel_event.dart';
import 'package:movie_db_app/presentation/blocs/movie_carousel/movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({@required this.getTrending,@required this.movieBackdropBloc})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
        (l) => MovieCarouselError(l.appErrorType),
        (movies) {
          movieBackdropBloc.add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }
}
