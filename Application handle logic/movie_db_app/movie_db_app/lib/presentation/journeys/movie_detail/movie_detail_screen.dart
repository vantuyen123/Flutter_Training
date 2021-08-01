import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/di/get_it.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_event.dart';
import 'package:movie_db_app/presentation/blocs/movie_detail/movie_detail_state.dart';
import 'package:movie_db_app/presentation/journeys/movie_detail/movie_detail_argument.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'big_poster.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArgument movieDetailArgument;

  const MovieDetailScreen({Key key, @required this.movieDetailArgument})
      : assert(movieDetailArgument != null, 'argument must not be null'),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc _movieDetailBloc;

  @override
  void initState() {
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _movieDetailBloc
        .add(MovieDetailLoadEvent(widget.movieDetailArgument.movieId));
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>.value(
        value: _movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            builder: (context, state) {
          if (state is MovieDetailLoaded) {
            final movieDetail = state.movieDetailEntity;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                BigPoster(movie: movieDetail),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w,),
                  child: Text(
                    movieDetail.overview,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
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