import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/language.dart';
import 'package:movie_db_app/domain/entities/language_entity.dart';
import 'package:movie_db_app/domain/entities/no_params.dart';
import 'package:movie_db_app/domain/usecase/get_preferred_language.dart';
import 'package:movie_db_app/domain/usecase/update_language.dart';

class LanguageCubit extends Cubit<Locale> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageCubit({
    @required this.getPreferredLanguage,
    @required this.updateLanguage,
  }) : super(
          Locale(Languages.languages[0].code),
        );

  void toggleLanguage(LanguageEntity language) async {
    await updateLanguage(language.code);
    loadPreferredLanguage();
  }

  void loadPreferredLanguage() async {
    final response = await getPreferredLanguage(NoParams());
    emit(
      response.fold(
        (l) => null,
        (r) => Locale(r),
      ),
    );
  }

/*@override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      await updateLanguage(event.language.code);
      add(LoadPreferredLanguageEvent());
    } else if (event is LoadPreferredLanguageEvent) {
      final response = await getPreferredLanguage(NoParams());
      yield response.fold(
        (l) => LanguageError(),
        (r) => LanguageLoaded(Locale(r)),
      );
    }
  }*/
}
