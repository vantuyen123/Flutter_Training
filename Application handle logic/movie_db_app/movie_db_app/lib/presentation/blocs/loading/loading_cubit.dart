import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<bool>{
  LoadingCubit() : super(false);

  void show() => emit(true);

  void hide() => emit(false);
/*
  @override
  Stream<LoadingState> mapEventToState(LoadingEvent event) async* {
    if(event is StartLoading){
      yield LoadingStarted();
    }else if(event is FinishLoading){
      yield LoadingFinished();
    }
  }*/

}