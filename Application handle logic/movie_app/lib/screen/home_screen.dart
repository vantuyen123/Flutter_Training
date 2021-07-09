import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/style/theme.dart' as Style;
import 'package:movie_app/widgets/genre.dart';
import 'package:movie_app/widgets/now_playing.dart';
import 'package:movie_app/widgets/person.dart';
import 'package:movie_app/widgets/top_movies.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        title: Text("Movie App"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView(
        children: [
          NowPlaying(),
          GenreScreen(),
          PersonsList(),
          TopMovies()
        ],
      ),
    );
  }
}
