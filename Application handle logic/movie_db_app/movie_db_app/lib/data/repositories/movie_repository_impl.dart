import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_db_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository{

  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError,List<MovieEntity>>> getTrending() async {
      try{
        final movies = await remoteDataSource.getTrending();
        return right(movies);
      }on SocketException{
        return left(AppError(AppErrorType.network));
      }on Exception{
        return Left(AppError(AppErrorType.api ));
      }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try{
      final movies = await remoteDataSource.getComingSoon();
      return right(movies);
    }on SocketException{
      return left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api ));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try{
      final movies = await remoteDataSource.getPlayingNow();
      return right(movies);
    }on SocketException{
      return left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api ));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try{
      final movies = await remoteDataSource.getPopular  ();
      return right(movies);
    }on SocketException{
      return left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api ));
    }
  }
}