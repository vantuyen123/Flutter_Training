import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/bloc/get_movies_byGenre_bloc.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/style/theme.dart' as Style;
import 'package:movie_app/widgets/genre_movies.dart';

class GenresList extends StatefulWidget {
  final List<Genre> genres;

  const GenresList({Key key, this.genres}) : super(key: key);

  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  TabController _tabController;

  _GenresListState(this.genres);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: genres.length, vsync: this);
    _tabController.addListener(() {
      if(_tabController.indexIsChanging){
        moviesByGenreBloc..drainStream();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307,
      child: DefaultTabController(
        length: genres.length,
        child: Scaffold(
          backgroundColor: Style.Colors.mainColor,
          appBar: _buildAppbar(),
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: genres
                .map((Genre genre) => GenreMovies(
                      genreId: genre.id,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Style.Colors.secondColor,
        indicatorWeight: 3.0,
        unselectedLabelColor: Style.Colors.titleColor,
        labelColor: Colors.white,
        isScrollable: true,
        tabs: genres
            .map((e) => Container(
                  padding: EdgeInsets.only(bottom: 15, top: 10),
                  child: Text(
                    e.name.toUpperCase(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
