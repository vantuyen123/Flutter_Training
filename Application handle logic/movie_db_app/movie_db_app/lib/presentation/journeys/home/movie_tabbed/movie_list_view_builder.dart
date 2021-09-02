import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key key, @required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 14.w);
          },
          itemBuilder: (context, index) {
            final MovieEntity movie = movies[index];
            return MovieTabCardWidget(
                movieId: movie.id,
                title: movie.title,
                posterPath: movie.posterPath);
          },
          itemCount: movies.length),
    );
  }
}
