import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';
import 'package:movie_db_app/presentation/blocs/movie_backdrop/movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial());

  @override
  Stream<MovieBackdropState> mapEventToState(event) async* {
    yield MovieBackdropChanged((event as MovieBackdropChangedEvent).movie);
  }

}