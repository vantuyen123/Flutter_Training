import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/constants/translation_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/common/extensions/string_extensions.dart';
import 'package:movie_db_app/presentation/blocs/search_movie/search_cubit.dart';
import 'package:movie_db_app/presentation/blocs/search_movie/search_state.dart';
import 'package:movie_db_app/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:movie_db_app/presentation/themes/app_color.dart';
import 'package:movie_db_app/presentation/themes/theme_text.dart';
import 'package:movie_db_app/presentation/widgets/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieCubit searchMovieCubit;

  CustomSearchDelegate(this.searchMovieCubit);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: InputBorder.none,
            hintStyle: Theme
                .of(context)
                .textTheme
                .greySubtitle1));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty ? null : () => query = '',
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieCubit.searchTermChanged(query);
    return BlocBuilder<SearchMovieCubit, SearchMovieState>(
        bloc: searchMovieCubit, builder: (context, state) {
      if (state is SearchMovieError) {
        return AppErrorWidget(errorType: state.errorType,
            onPressed: () => searchMovieCubit?.searchTermChanged(query));
      }else if( state is SearchMovieLoaded){
        final movies = state.movies;
        if(movies.isEmpty){
          return Center(
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
              child: Text(
                TranslationConstants.noMoviesSearch.t(context),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: movies.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index) => SearchMovieCard(
          movie: movies[index],
        ));
      }else{
        return const SizedBox.shrink();
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
