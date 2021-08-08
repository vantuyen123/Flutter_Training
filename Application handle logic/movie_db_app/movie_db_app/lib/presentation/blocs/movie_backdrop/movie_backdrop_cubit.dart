import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';

class  MovieBackdropCubit extends Cubit<MovieEntity> {
  MovieBackdropCubit() : super(null);

  void backdropChanged(MovieEntity movie){
    emit(movie);
  }
  /*
  @override
  Stream<MovieBackdropState> mapEventToState(event) async* {
    yield MovieBackdropChanged((event as MovieBackdropChangedEvent).movie);
  }
*/
}