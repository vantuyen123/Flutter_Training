import 'package:dartz/dartz.dart';
import 'package:movie_db_app/data/repositories/authentication_repository.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/usecase.dart';

class LogoutUser extends UseCase<void,NoParams>{
  final AuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) async => _authenticationRepository.logoutUser();

}