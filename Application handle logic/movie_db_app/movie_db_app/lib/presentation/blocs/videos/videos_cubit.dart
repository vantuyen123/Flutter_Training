import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/data/models/video_entity.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/usecase/get_videos.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  final GetVideos getVideos;

  VideosCubit({@required this.getVideos}) : super(VideosInitial());

  void loadVideos(int movieId) async {
    final Either<AppError, List<VideoEntity>> eitherVideoResponse =
        await getVideos(MovieParams(movieId));
    emit(
      eitherVideoResponse.fold(
        (l) => NoVideos(),
        (r) => VideosLoaded(r),
      ),
    );
  }


}
