import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/bloc/get_now_playing_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/style/theme.dart' as Style;
import 'package:movie_app/widgets/constant.dart';
import 'package:page_indicator/page_indicator.dart';

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowPlayingMovieBloc.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
        stream: nowPlayingMovieBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return buildErrorWidget(snapshot.data.error);
            }
            return _buildNowPlayingWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.error);
          } else {
            return buildLoadingWidget();
          }
        });
  }

  Widget _buildNowPlayingWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('No Movies')],
        ),
      );
    } else {
      return Container(
        height: 220,
        child: PageIndicatorContainer(
            align: IndicatorAlign.bottom,
            padding: EdgeInsets.all(5),
            shape: IndicatorShape.circle(size: 8),
            indicatorColor: Style.Colors.titleColor,
            indicatorSelectorColor: Style.Colors.secondColor,
            length: movies.take(5).length,
            child: PageView.builder(
                itemCount: movies.take(5).length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/original/" + movies[index].backPoster,),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Style.Colors.mainColor.withOpacity(1.0),
                                  Style.Colors.mainColor.withOpacity(0.0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.0, 0.9])),
                      ),
                      Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Icon(
                            FontAwesomeIcons.playCircle,
                            color: Style.Colors.secondColor,
                            size: 40,
                          )),
                      Positioned (
                          bottom: 30,
                          child: Container(
                            width: 250,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movies[index].title,
                                  style: TextStyle(
                                      height: 1.5,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ))
                    ],
                  );
                })),
      );
    }
  }


}
