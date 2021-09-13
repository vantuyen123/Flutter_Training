import 'package:equatable/equatable.dart';
import 'package:movie_db_app/data/models/video_entity.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class VideosInitial extends VideosState {}

class NoVideos extends VideosState {}

class VideosLoaded extends VideosState {
  final List<VideoEntity> videos;

  VideosLoaded(this.videos);

  @override
  // TODO: implement props
  List<Object> get props => [videos];
}
