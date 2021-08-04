import 'package:dartz/dartz.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/repositories/movie_repository.dart';
import 'package:movie_db_app/domain/usecase/usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity,MovieParams>{
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<AppError,MovieDetailEntity>> call(MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
