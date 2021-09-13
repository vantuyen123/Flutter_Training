import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/domain/entities/cast_entity.dart';

abstract class CastState extends Equatable{
  const CastState();

  @override
  List<Object> get props=> [];
}

class CastInitial extends CastState{}

class CastLoaded extends CastState{
  final List<CastEntity> casts;

  CastLoaded({@required this.casts});

  @override
  // TODO: implement props
  List<Object> get props => [casts];
}

class CastError extends CastState{}