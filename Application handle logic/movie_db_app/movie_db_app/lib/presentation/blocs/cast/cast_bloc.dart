import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/domain/entities/app_error.dart';
import 'package:movie_db_app/domain/entities/cast_entity.dart';
import 'package:movie_db_app/domain/entities/movie_params.dart';
import 'package:movie_db_app/domain/usecase/get_cast.dart';

import 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final GetCast getCasts;

  CastCubit({@required this.getCasts}) : super(CastInitial());

  void loadCast(int movieId) async {
    Either<AppError, List<CastEntity>> eitherResponse =
        await getCasts(MovieParams(movieId));

    emit(eitherResponse.fold(
      (l) => CastError(),
      (r) => CastLoaded(casts: r),
    ));
  }

// @override
// Stream<CastState> mapEventToState(CastEvent event) async* {
//   if (event is LoadCastEvent) {
//     Either<AppError, List<CastEntity>> eitherResponse =
//         await getCasts(MovieParams(event.movieId));
//
//     yield eitherResponse.fold(
//       (l) => CastError(),
//       (r) => CastLoaded(casts: r),
//     );
//   }
// }
}
