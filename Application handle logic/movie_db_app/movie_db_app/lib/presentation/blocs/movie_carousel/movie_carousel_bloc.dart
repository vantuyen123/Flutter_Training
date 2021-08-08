import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/get_trending.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_cubit.dart';
import 'package:movie_db_app/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_db_app/presentation/blocs/movie_carousel/movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropCubit movieBackdropCubit;
  final LoadingCubit loadingCubit;
  MovieCarouselCubit(
      {@required this.getTrending,
      @required this.movieBackdropCubit,
      @required this.loadingCubit})
      : super(MovieCarouselInitial());

  void loadCarousel({int defaultIndex = 0}) async{
    loadingCubit.show();
    final moviesEither = await getTrending(NoParams());
    emit(moviesEither.fold(
        (l)=> MovieCarouselError(l.appErrorType),
        (movies){
          movieBackdropCubit.backdropChanged(movies[defaultIndex]);
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: defaultIndex
          );
        }
    ));
    loadingCubit.hide();
  }


 /* @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      loadingCubit.show();
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
        (l) => MovieCarouselError(l.appErrorType),
        (movies) {
          movieBackdropCubit
              .backdropChanged(movie[defauint]);
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
    loadingCubit.hide();
  }*/
}
