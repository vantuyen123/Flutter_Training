import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:movie_db_app/presentation/widgets/movie_app_bar.dart';
import 'package:movie_db_app/presentation/widgets/separator.dart';

import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({Key key, this.movies, this.defaultIndex})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            MovieDataWidget(),
            Separator()
          ],
        ),
      ],
    );
  }
}
