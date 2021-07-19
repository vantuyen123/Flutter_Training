import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_event.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_state.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentIndex));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(top: Sizes.dimen_4.h),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                  TabTitleWidget(
                    title: MovieTabbedConstants.movieTabs[i].title,
                    onTap: () => _onTabTapped(i),
                    isSelected: MovieTabbedConstants.movieTabs[i].index ==
                        state.currentTabIndex,
                  )
              ],
            ),
            if (state is MovieTabChanged)
              Expanded(
                child: MovieListViewBuilder(
                  movies: state.movies,
                ),
              )
          ],
        ),
      );
    });
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
