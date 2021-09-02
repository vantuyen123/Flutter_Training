import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_event.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_state.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({Key key, @required this.movieDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
        BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
          if (state is IsFavoriteMovie) {
            return GestureDetector(
              onTap: () => BlocProvider.of<FavoriteBloc>(context).add(
                ToggleFavoriteMovieEvent(
                  MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                  state.isMovieFavorite,
                ),
              ),
              child: Icon(
                state.isMovieFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              ),
            );
          } else {
            return Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            );
          }
        }),
      ],
    );
  }
}
