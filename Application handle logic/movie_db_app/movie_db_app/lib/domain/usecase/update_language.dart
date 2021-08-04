import 'package:dartz/dartz.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/repositories/app_repository.dart';
import 'package:movie_db_app/domain/usecase/usecase.dart';

class UpdateLanguage extends UseCase<void, String> {
  final AppRepository appReopository;

  UpdateLanguage(this.appReopository);

  @override
  Future<Either<AppError, void>> call(String params) async {
    return await appReopository.updateLanguage(params);
  }
}
