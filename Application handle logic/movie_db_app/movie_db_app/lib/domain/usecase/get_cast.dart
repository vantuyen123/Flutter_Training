import 'package:dartz/dartz.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/cast_entity.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/repositories/movie_repository.dart';
import 'package:movie_db_app/domain/usecase/usecase.dart';

class GetCast extends Usecase<List<CastEntity>,MovieParams>{
  final MovieRepository repository;

  GetCast(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await repository.getCastCrew(params.id);
  }

}