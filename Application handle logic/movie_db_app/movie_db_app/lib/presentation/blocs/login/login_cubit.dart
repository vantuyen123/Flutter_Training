import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/translation_constants.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/login_request_params.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/login_user.dart';
import 'package:movie_db_app/domain/usecase/logout_user.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_cubit.dart';
import 'package:movie_db_app/presentation/blocs/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  final LoadingCubit loadingCubit;

  LoginCubit({
    @required this.loadingCubit,
    @required this.loginUser,
    @required this.logoutUser,
  }) : super(LoginInitial());

  void initiateLogin(String username, password) async {
    loadingCubit.show();
    final Either<AppError, bool> eitherResponse = await loginUser(
        LoginRequestParams(userName: username, password: password));

    emit(
      eitherResponse.fold(
        (l) {
          var message = getErrorMessage(l.appErrorType);
          print(message);
          return LoginError(message);
        },
        (r) => LoginSuccess(),
      ),
    );
  }

  void logout() async{
    await logoutUser(NoParams());
    emit(LogoutSuccess());
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return TranslationConstants.noNetwork;
      case AppErrorType.api:
      case AppErrorType.database:
        return TranslationConstants.someThingWentWrong;
      case AppErrorType.sessionDenied:
        return TranslationConstants.sessionDenied;
      default:
        return TranslationConstants.wrongUsernamePassword;
    }
  }
}
