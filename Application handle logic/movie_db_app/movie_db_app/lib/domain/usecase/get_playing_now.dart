import 'package:dartz/dartz.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/repositories/movie_repository.dart';
import 'package:movie_db_app/domain/usecase/usecase.dart';

class GetPlayingNow extends Usecase<List<MovieEntity>,NoParams>{
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPlayingNow();
  }
}
