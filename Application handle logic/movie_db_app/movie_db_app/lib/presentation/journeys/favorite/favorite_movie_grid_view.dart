import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';

import 'favorite_movie_card_widget.dart';

class FavoriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavoriteMovieGridView({Key key, @required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w),
      child: GridView.builder(
        itemCount: movies.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: Sizes.dimen_16.w),
        itemBuilder: (context, index) {
          return FavoriteMovieCardWidget(
            movie: movies[index],
           );
        },
      ),
    );
  }
}
