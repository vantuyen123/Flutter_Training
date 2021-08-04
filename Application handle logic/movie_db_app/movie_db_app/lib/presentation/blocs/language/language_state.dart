import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  // TODO: implement props
  List<Object> get props => [locale.languageCode];
}

class LanguageError extends LanguageState {}
