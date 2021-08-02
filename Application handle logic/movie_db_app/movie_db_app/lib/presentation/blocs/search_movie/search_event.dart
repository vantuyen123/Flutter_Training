import 'package:equatable/equatable.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchTermChangedEvent extends SearchMovieEvent {
  final String searchTerm;

  SearchTermChangedEvent(this.searchTerm);

  @override
  // TODO: implement props
  List<Object> get props => [searchTerm];
}
