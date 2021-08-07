import 'package:equatable/equatable.dart';

class LoadingState extends Equatable {
  const LoadingState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingInitial extends LoadingState{}

class LoadingStarted extends LoadingState{}

class LoadingFinished extends LoadingState{}
