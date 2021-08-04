import 'package:dartz/dartz.dart';
import 'package:movie_db_app/data/models/video_entity.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/repositories/movie_repository.dart';
import 'package:movie_db_app/domain/usecase/usecase.dart';

class GetVideos extends UseCase<List<VideoEntity>,MovieParams>{
  final MovieRepository repository;

  GetVideos(this.repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async {
    return await repository.getVideos(params.id);
  }


}