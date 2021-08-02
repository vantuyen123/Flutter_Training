import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_db_app/data/core/api_client.dart';
import 'package:movie_db_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_db_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_db_app/domain/repositories/movie_repository.dart';
import 'package:movie_db_app/domain/usecase/get_cast.dart';
import 'package:movie_db_app/domain/usecase/get_comingsoon.dart';
import 'package:movie_db_app/domain/usecase/get_movie_detail.dart';
import 'package:movie_db_app/domain/usecase/get_playing_now.dart';
import 'package:movie_db_app/domain/usecase/get_popular.dart';
import 'package:movie_db_app/domain/usecase/get_trending.dart';
import 'package:movie_db_app/domain/usecase/get_videos.dart';
import 'package:movie_db_app/domain/usecase/search_movies.dart';
import 'package:movie_db_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_db_app/presentation/blocs/language/language_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_db_app/presentation/blocs/search_movie/search_bloc.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  getItInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));

  getItInstance.registerFactory(() => MovieCarouselBloc(
      getTrending: getItInstance(), movieBackdropBloc: getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getComingSoon: getItInstance(),
      getPlayingNow: getItInstance(),
      getPopular: getItInstance(),
    ),
  );

  getItInstance.registerFactory(() => CastBloc(getCasts: getItInstance()));
  getItInstance.registerFactory(() => VideosBloc(getVideos: getItInstance()));
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  getItInstance.registerFactory(() => SearchMovieBloc(
        searchMovies: getItInstance(),
      ));

  getItInstance.registerLazySingleton<GetMovieDetail>(
    () => GetMovieDetail(getItInstance()),
  );
  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videosBloc: getItInstance(),
    ),
  );
}
