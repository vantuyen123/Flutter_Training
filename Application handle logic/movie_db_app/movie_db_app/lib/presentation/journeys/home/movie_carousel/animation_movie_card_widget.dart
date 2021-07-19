import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/common/screenutil/screenutil.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCardWidget(
      {Key key, this.index,
        this.movieId,
        this.posterPath,
        this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context,child){
        double value = 1;
        if(pageController.position.haveDimensions){
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.1).clamp(0.0, 1.0));
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) * ScreenUtil.screenHeight *0.35,
              width: Sizes.dimen_230.w,
              child: child ,
            ),
          );
        }
        else{
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(index == 0 ? value : value * 0.5) * ScreenUtil.screenHeight *0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath ,
      ),
    );
  }
}
