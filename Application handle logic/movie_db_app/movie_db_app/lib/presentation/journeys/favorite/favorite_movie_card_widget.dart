import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/route_constants.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/data/core/api_constants.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_cubit.dart';
import 'package:movie_db_app/presentation/journeys/movie_detail/movie_detail_argument.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({Key key, @required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dimen_8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(RouteList.movieDetail,
              arguments: MovieDetailArgument(movie.id));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_100.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<FavoriteCubit>(context)
                      .deleteMovie(movie.id),
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_12.w),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_12.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
