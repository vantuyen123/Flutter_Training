import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_db_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_db_app/data/data_source/movie_table_data_source.dart';
import 'package:movie_db_app/data/models/cast_crew_result_data_model.dart';
import 'package:movie_db_app/data/models/movie_detail_model.dart';
import 'package:movie_db_app/data/models/movie_model.dart';
import 'package:movie_db_app/data/models/video_model.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/domain/repositories/movie_repository.dart';
import 'package:movie_db_app/domain/table/movie_table.dart';

class MovieRepositoryImpl extends MovieRepository{

  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);

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

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try{
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    }on SocketException{
      return Left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getCastCrew(int id) async {
    try{
      final castCrew = await remoteDataSource.getCastCrew(id);
      return Right(castCrew);
    }on SocketException{
      return Left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<VideoModel>>> getVideos(int id) async {
    try{
      final videos = await remoteDataSource.getVideos(id);
      return Right(videos);
    }on SocketException{
      return Left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSearchMovies(String searchTerm) async {
    try{
      final movies = await remoteDataSource.getSearchMovies(searchTerm);
      return right(movies);
    }on SocketException{
      return left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api ));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId) async {
    try{
      final response = await localDataSource.checkIfMovieFavorite(movieId);
      return Right(response);
    }on Exception{
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavoriteMovies(int movieId) async {
    try{
      final response = await localDataSource.deleteMovie(movieId);
      return Right(response);
    }on Exception{
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies() async {
    try{

      final response = await localDataSource.getMovies();
      return Right(response);
    }on Exception{
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async {
    try{
      final response = await localDataSource.saveMovie(MovieTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
}