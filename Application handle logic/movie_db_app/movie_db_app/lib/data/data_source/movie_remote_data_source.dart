import 'dart:async';

import 'package:movie_db_app/data/core/api_client.dart';
import 'package:movie_db_app/data/models/cast_crew_result_data_model.dart';
import 'package:movie_db_app/data/models/movie_detail_model.dart';
import 'package:movie_db_app/data/models/movie_model.dart';
import 'package:movie_db_app/data/models/movies_result_model.dart';
import 'package:movie_db_app/data/models/video_model.dart';
import 'package:movie_db_app/data/models/video_result_model.dart';

abstract class  MovieRemoteDataSource {
  MovieRemoteDataSource(apiClient);

  Future<List<MovieModel>> getTrending();

  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getPlayingNow();

  Future<List<MovieModel>> getComingSoon();

  Future<MovieDetailModel> getMovieDetail(int id);

  Future<List<CastModel>> getCastCrew(int id);

  Future<List<VideoModel>> getVideos(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client) : super(null);


  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Get Trending');
    print(movies);
    return movies; 
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Get Popular');
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response  = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Get Upcoming');
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Get Now Playing');
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print('Get Now Playing');
    print(movie);
    return movie;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    print('Get Cast Crew');
    print(cast);
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    final videos = VideoResultModel.fromJson(response).videos;
    print('Get Videos');
    print(videos);
    return videos;
  }
}