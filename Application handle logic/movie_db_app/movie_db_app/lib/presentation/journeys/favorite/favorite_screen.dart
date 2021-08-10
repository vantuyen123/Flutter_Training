import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/constants/translation_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart ';
import 'package:movie_db_app/common/extensions/string_extensions.dart';
import 'package:movie_db_app/di/get_it.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_cubit.dart';
import 'package:movie_db_app/presentation/blocs/favorite/favorite_state.dart';

import 'favorite_movie_grid_view.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteCubit _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _favoriteBloc = getItInstance<FavoriteCubit>();
    _favoriteBloc.loadFavoriteMovie();
  }

  @override
  void dispose() {
    _favoriteBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.favoriteMovies.t(context),
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: Sizes.dimen_10.h),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_24.w,
          ),
        ),
      ),
      body: BlocProvider.value(
        value: _favoriteBloc,
        child: BlocBuilder<FavoriteCubit,FavoriteState>(
          builder: (BuildContext context, state) {
            if(state is FavoriteMoviesLoaded){
              if(state.movies.isEmpty){
                return Center(
                  child: Text(
                    TranslationConstants.noFavoriteMovies.t(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }
              return FavoriteMovieGridView(
                movies:state.movies
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
