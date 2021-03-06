import 'package:equatable/equatable.dart';

class AppError extends Equatable{
  final AppErrorType appErrorType;

  const AppError(this.appErrorType);

  @override
  List<Object> get props {
    return [appErrorType];
  }
}

enum AppErrorType{api,network,database,unauthorised,sessionDenied}