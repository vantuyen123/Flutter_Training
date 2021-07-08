import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/Genre_response.dart';
import 'package:movie_app/model/cast_response.dart';
import 'package:movie_app/model/movie_detail_response.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/person_response.dart';
import 'package:movie_app/model/video_response.dart';

class MovieRepository {
  static String apiKey = "a490ec19c2b9bb709c213ad4bf8c6c22";
  static String mainUrl = "https://api.themoviedb.org/3";

  final Dio _dio = Dio();

  var getPopularUrl = "$mainUrl/movie/top_rated";
  var getMovieUrl = "$mainUrl/discover/movie";
  var getPlayingUrl = "$mainUrl/movie/now_playing";
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPersonsUrl = "$mainUrl/trending/person/week";
  var movieUrl = '$mainUrl/movie';

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": "en-Us", "page": 1};
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-Us", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-Us", "page": 1};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPerson() async {
    var params = {
      "api_key": apiKey,
    };
    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);

      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en_US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMovieUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };

    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {'api_key': apiKey, 'language': 'en-US'};
    try {
      Response response = await _dio.get(movieUrl + '/$id' + '/credits',
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {'api_key': apiKey, 'language': 'en-US'};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return VideoResponse.withError("$error");
    }
  }
}
