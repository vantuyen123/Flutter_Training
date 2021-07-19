import 'package:dartz/dartz.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';

abstract class Usecase<Type,Params>{
  Future<Either<AppError,Type>> call(Params params);
}