import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_db_app/data/core/api_client.dart';
import 'package:movie_db_app/data/data_source/authenticatation_local_data_source.dart';
import 'package:movie_db_app/data/data_source/authentication_remote_data_source.dart';
import 'package:movie_db_app/data/data_source/language_loacl_data_source.dart';
import 'package:movie_db_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_db_app/data/data_source/movie_table_data_source.dart';
import 'package:movie_db_app/data/repositories/authentication_repository.dart';
import 'package:movie_db_app/data/repositories/authentication_repository_impl.dart';
import 'package:movie_db_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_db_app/domain/repositories/app_repository.dart';
import 'package:movie_db_app/domain/repositories/app_repository_impl.dart';
import 'package:movie_db_app/domain/repositories/movie_repository.dart';
import 'package:movie_db_app/domain/usecase/check_if_movie_favorite.dart';
import 'package:movie_db_app/domain/usecase/delete_favorite_movies.dart';
import 'package:movie_db_app/domain/usecase/get_cast.dart';
import 'package:movie_db_app/domain/usecase/get_comingsoon.dart';
import 'package:movie_db_app/domain/usecase/get_favorite_movies.dart';
import 'package:movie_db_app/domain/usecase/get_movie_detail.dart';
import 'package:movie_db_app/domain/usecase/get_playing_now.dart';
import 'package:movie_db_app/domain/usecase/get_popular.dart';
import 'package:movie_db_app/domain/usecase/get_preferred_language.dart';
import 'package:movie_db_app/domain/usecase/get_trending.dart';
import 'package:movie_db_app/domain/usecase/get_videos.dart';
import 'package:movie_db_app/domain/usecase/login_user.dart';
import 'package:movie_db_app/domain/usecase/logout_user.dart';
import 'package:movie_db_app/domain/usecase/save_movie.dart';
import 'package:movie_db_app/domain/usecase/search_movies.dart';
import 'package:movie_db_app/domain/usecase/update_language.dart';
import 'package:movie_db_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movie_db_app/presentation/blocs/language/language_bloc.dart';
import 'package:movie_db_app/presentation/blocs/login/login_bloc.dart';
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

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance
      .registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));
  getItInstance.registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(getItInstance()));
  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
      () => DeleteFavoriteMovie(getItInstance()));
  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
      () => CheckIfFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  getItInstance
      .registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
            getItInstance(),
            getItInstance(),
          ));

  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        getItInstance(),
      ));

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
  /**
   *
   *  GetInstance Module Login
   * **/

  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());

  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(getItInstance(), getItInstance()));

  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));
  getItInstance.registerLazySingleton<LogoutUser>(() => LogoutUser(getItInstance()));


  getItInstance.registerFactory(
    () => LoginBloc(
      loginUser: getItInstance(),
      logoutUser: getItInstance(),
    ),
  );
  /**
   * // GetInstance Login
   * */
  getItInstance.registerFactory(() => CastBloc(getCasts: getItInstance()));
  getItInstance.registerFactory(() => VideosBloc(getVideos: getItInstance()));
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc(
    updateLanguage: getItInstance(),
    getPreferredLanguage: getItInstance(),
  ));

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
      favoriteBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => FavoriteBloc(
        saveMovie: getItInstance(),
        getFavoriteMovies: getItInstance(),
        deleteFavoriteMovie: getItInstance(),
        checkIfMovieFavorite: getItInstance()),
  );
}
