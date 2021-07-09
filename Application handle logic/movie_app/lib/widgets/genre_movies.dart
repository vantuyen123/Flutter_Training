import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/bloc/get_movies_byGenre_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/style/theme.dart' as Style;
import 'package:movie_app/widgets/constant.dart';

class GenreMovies extends StatefulWidget {
  final int genreId;

  const GenreMovies({Key key, this.genreId}) : super(key: key);

  @override
  _GenreMoviesState createState() => _GenreMoviesState(genreId);
}

class _GenreMoviesState extends State<GenreMovies> {
  final int genreId;

  _GenreMoviesState(this.genreId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesByGenreBloc.getMovieByGenre(genreId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: moviesByGenreBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return buildErrorWidget(snapshot.data.error);
            }
            return _buildMoviesByGenreWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.error);
          } else {
            return buildLoadingWidget();
          }
        });
  }

  Widget _buildMoviesByGenreWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return Container(
        child: Text("No Movies"),
      );
    } else
      return Container(
        height: 300,
        padding: EdgeInsets.only(left: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                child: Column(
                  children: [
                    movies[index].poster == null
                        ? Container(
                            width: 180,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Style.Colors.secondColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                shape: BoxShape.rectangle),
                            child: Column(
                              children: [
                                Icon(
                                  EvaIcons.filmOutline,
                                  color: Colors.white,
                                  size: 50,
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: 120,
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w200/' +
                                          movies[index].poster,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                    SizedBox(height: 5),
                    Container(
                      width: 100,
                      child: Text(
                        movies[index].title,
                        maxLines: 2,
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Text(
                          movies[index].rating.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RatingBar.builder(
                          itemSize: 8.0,
                          initialRating: movies[index].rating / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context,_) => Icon(
                            EvaIcons.star,
                            color: Style.Colors.secondColor,
                          ),
                          onRatingUpdate: (rating){
                            print(rating);
                          },
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      );
  }
}
