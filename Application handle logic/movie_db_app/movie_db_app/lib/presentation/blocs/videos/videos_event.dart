import 'package:equatable/equatable.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object> get props => [];
}

class LoadVideoEvent extends VideosEvent {
  final int movieId;

  LoadVideoEvent(this.movieId);

  @override
  // TODO: implement props
  List<Object> get props => [movieId];
}
