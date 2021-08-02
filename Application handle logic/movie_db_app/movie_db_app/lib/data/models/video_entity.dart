import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable{
  final String title,key,type;

  VideoEntity({
    this.title,
    this.key,
    this.type
}) ;

  @override
  // TODO: implement props
  List<Object> get props => [title];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}