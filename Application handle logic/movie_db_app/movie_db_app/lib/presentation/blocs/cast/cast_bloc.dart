import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/cast_entity.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/usecase/get_cast.dart';

import 'cast_event.dart';
import 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCast getCasts;

  CastBloc({@required this.getCasts}) : super(CastInitial());

  @override
  Stream<CastState> mapEventToState(CastEvent event) async* {
    if (event is LoadCastEvent) {
      Either<AppError, List<CastEntity>> eitherResponse =
          await getCasts(MovieParams(event.movieId));

      yield eitherResponse.fold(
        (l) => CastError(),
        (r) => CastLoaded(casts: r),
      );
    }
  }
}
