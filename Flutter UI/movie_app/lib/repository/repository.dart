import 'package:dio/dio.dart';

class Repository{
  final String apiKey = "ba8f121a99aa03d398102e6fa5107285";

  final String mainUrl = "https://api.themoviedb.org/3";

  final Dio _dio = Dio();

  var getPopularUrl = "$mainUrl/movie/top_rated";
}