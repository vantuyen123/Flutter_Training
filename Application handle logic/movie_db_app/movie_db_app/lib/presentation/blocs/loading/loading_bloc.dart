import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_event.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent,LoadingState>{
  LoadingBloc() : super(LoadingInitial());

  @override
  Stream<LoadingState> mapEventToState(LoadingEvent event) async* {
    if(event is StartLoading){
      yield LoadingStarted();
    }else if(event is FinishLoading){
      yield LoadingFinished();
    }
  }

}