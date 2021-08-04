import 'package:equatable/equatable.dart';
import 'package:movie_db_app/domain/entities/language_entity.dart';

class LanguageEvent extends Equatable{
 const LanguageEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ToggleLanguageEvent extends LanguageEvent{
  final LanguageEntity language;

  ToggleLanguageEvent(this.language);
  @override
  // TODO: implement props
  List<Object> get props => [language.code];
}
class LoadPreferredLanguageEvent extends LanguageEvent{}