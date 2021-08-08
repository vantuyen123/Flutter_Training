import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/di/get_it.dart';
import 'package:movie_db_app/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movie_db_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_db_app/presentation/blocs/movie_carousel/movie_carousel_state.dart';
import 'package:movie_db_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_db_app/presentation/blocs/search_movie/search_bloc.dart';
import 'package:movie_db_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:movie_db_app/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';

import '../../widgets/app_error_widget.dart';
import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselCubit movieCarouselCubit;
  MovieBackdropCubit movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;
  SearchMovieBloc searchMovieBloc;
  @override
  void initState() {
    super.initState();
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieCarouselCubit = getItInstance<MovieCarouselCubit>();
    searchMovieBloc = getItInstance<SearchMovieBloc>();
    movieCarouselCubit.loadCarousel();
    movieBackdropBloc = movieCarouselCubit.movieBackdropCubit;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselCubit.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
    searchMovieBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselCubit,
        ),
        BlocProvider(create: (context) => movieBackdropBloc),
        BlocProvider(create: (context) => movieTabbedBloc),
        BlocProvider(create: (context) => searchMovieBloc),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          bloc: movieCarouselCubit,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  )
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                onPressed: () => movieCarouselCubit.loadCarousel(),
                errorType: state.errorType,

              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
