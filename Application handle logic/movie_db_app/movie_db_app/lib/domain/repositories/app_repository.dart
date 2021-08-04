import 'package:dartz/dartz.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';

abstract class AppRepository{
  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
}