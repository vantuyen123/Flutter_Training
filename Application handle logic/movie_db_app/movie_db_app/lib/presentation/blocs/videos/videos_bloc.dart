import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/data/models/video_entity.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/usecase/get_videos.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_event.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;

  VideosBloc({@required this.getVideos}) : super(VideosInitial());

  @override
  Stream<VideosState> mapEventToState(VideosEvent event) async* {
    if (event is LoadVideoEvent) {
      final Either<AppError, List<VideoEntity>> eitherVideoResponse =
          await getVideos(MovieParams(event.movieId));
      yield eitherVideoResponse.fold(
        (l) => NoVideos(),
        (r) => VideosLoaded(r),
      );
    }
  }
}
