import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/common/screenutil/screenutil.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_carousel/animation_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({Key key, this.movies, this.initialPage})
      : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: widget.initialPage,
        keepPage: false,
        viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
          pageSnapping: true,
          controller: _pageController,
          itemCount: widget.movies.length ?? 0,
          onPageChanged: (index) {
            BlocProvider.of<MovieBackdropCubit>(context).backdropChanged(widget.movies[index]);
          },
          itemBuilder: (context, index) {
            final MovieEntity movie = widget.movies[index];
            return AnimatedMovieCardWidget(
              index: index,
              pageController: _pageController,
              movieId: movie.id,
              posterPath: movie.posterPath,
            );
          }),
    );
  }
}
