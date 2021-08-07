import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/translation_constants.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/login_request_params.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/login_user.dart';
import 'package:movie_db_app/domain/usecase/logout_user.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_event.dart';
import 'package:movie_db_app/presentation/blocs/login/login_event.dart';
import 'package:movie_db_app/presentation/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  final LoadingBloc loadingBloc;

  LoginBloc({
    @required this.loadingBloc,
    @required this.loginUser,
    @required this.logoutUser,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInitiateEvent) {
      loadingBloc.add(StartLoading());
      final Either<AppError, bool> eitherResponse =
          await loginUser(LoginRequestParams(
        userName: event.username,
        password: event.password,
      ));
      yield eitherResponse.fold(
        (l) {
          var message = getErrorMessage(l.appErrorType);
          print(message);
          return LoginError(message);
        },
        (r) => LoginSuccess(),
      );
      loadingBloc.add(FinishLoading());
    }else if(event is LogoutEvent){
      loadingBloc.add(StartLoading());
      await logoutUser(NoParams());
      yield LogoutSuccess();
    }
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
