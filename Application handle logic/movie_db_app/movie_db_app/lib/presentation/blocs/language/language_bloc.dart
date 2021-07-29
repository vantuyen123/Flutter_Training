import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/language.dart';

import 'language_event.dart';
import 'language_state.dart';
/*

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(
          LanguageLoaded(
            Locale(Languages.languages[0].code),
          ),
        );

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is ToggleLanguageEvent) {
      yield LanguageLoaded(Locale(event.language.code));
    }
  }
}
*/
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(
    LanguageLoaded(
      Locale(Languages.languages[0].code),
    ),
  );

  @override
  Stream<LanguageState> mapEventToState(
      LanguageEvent event,
      ) async* {
    if (event is ToggleLanguageEvent) {
      yield LanguageLoaded(Locale(event.language.code));
    }
  }
}
