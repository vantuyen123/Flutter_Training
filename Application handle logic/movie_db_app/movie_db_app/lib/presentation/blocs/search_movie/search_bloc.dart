import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/movie_entity.dart';
import 'package:movie_db_app/domain/entities/movie_search_params.dart';
import 'package:movie_db_app/domain/usecase/search_movies.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_event.dart';
import 'package:movie_db_app/presentation/blocs/loading/loading_state.dart';
import 'package:movie_db_app/presentation/blocs/search_movie/search_event.dart';
import 'package:movie_db_app/presentation/blocs/search_movie/search_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;
  final LoadingBloc loadingBloc;

  SearchMovieBloc({
    @required this.loadingBloc,
    @required this.searchMovies,
  }) : super(SearchMovieInitial());

  @override
  Stream<SearchMovieState> mapEventToState(SearchMovieEvent event) async* {
    if (event is SearchTermChangedEvent) {
      loadingBloc.add(StartLoading());
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();
        final Either<AppError, List<MovieEntity>> response =
            await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));
        yield response.fold(
          (l) => SearchMovieError(l.appErrorType),
          (r) => SearchMovieLoaded(r),
        );
      }
    }
    loadingBloc.add(FinishLoading());
  }
}
