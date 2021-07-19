import 'package:equatable/equatable.dart';

abstract class MovieCarouselEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  CarouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props {
    return [defaultIndex];
  }
}
