import 'package:dartz/dartz.dart';
import 'package:movie_db_app/data/models/video_entity.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/cast_entity.dart';
import 'package:movie_db_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();

  Future<Either<AppError, List<MovieEntity>>> getPopular();

  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();

  Future<Either<AppError, List<MovieEntity>>> getComingSoon();

  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);

  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);

  Future<Either<AppError, List<VideoEntity>>> getVideos(int id);

  Future<Either<AppError, List<MovieEntity>>> getSearchMovies(String searchTerm);
}
