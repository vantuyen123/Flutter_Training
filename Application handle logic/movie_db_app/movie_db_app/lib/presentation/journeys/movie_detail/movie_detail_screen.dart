import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/constants/translation_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/common/extensions/string_extensions.dart';
import 'package:movie_db_app/di/get_it.dart';
import 'package:movie_db_app/presentation/blocs/cast/cast_cubit.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_cubit.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_cubit.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_state.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_cubit.dart';
import 'package:movie_db_app/presentation/journeys/movie_detail/movie_detail_argument.dart';
import 'package:movie_db_app/presentation/journeys/movie_detail/videos_widget.dart';

import 'big_poster.dart';
import 'cast_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArgument movieDetailArgument;

  const MovieDetailScreen({Key key, @required this.movieDetailArgument})
      : assert(movieDetailArgument != null, 'argument must not be null'),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailCubit _movieDetailBloc;
  CastCubit _castBloc;
  VideosCubit _videosBloc;
  FavoriteCubit _favoriteBloc;

  @override
  void initState() {
    _movieDetailBloc = getItInstance<MovieDetailCubit>();
    _movieDetailBloc.loadMovieDetail(widget.movieDetailArgument.movieId);
    _castBloc = _movieDetailBloc.castCubit;
    _videosBloc = _movieDetailBloc.videosCubit;
    _favoriteBloc = _movieDetailBloc.favoriteCubit;
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    _castBloc?.close();
    _videosBloc?.close();
    _favoriteBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videosBloc),
          BlocProvider.value(value: _favoriteBloc)
        ],
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
            builder: (context, state) {
          if (state is MovieDetailLoaded) {
            final movieDetail = state.movieDetailEntity;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BigPoster(movie: movieDetail),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                        vertical: Sizes.dimen_8.h),
                    child: Text(
                      movieDetail.overview,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                    child: Text(
                      TranslationConstants.cast.t(context),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  CastWidget(),
                  VideosWidget(videosBloc: _videosBloc),
                ],
              ),
            );
          } else if (state is MovieDetailError) {
            return Container();
          }
          return SizedBox.shrink();
        }),
      ),
    );
  }
}
