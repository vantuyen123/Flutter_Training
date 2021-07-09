import 'package:movie_app/model/cast_response.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CastBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CastResponse > _subject = BehaviorSubject<CastResponse>();

  getCasts(int id) async{
    CastResponse castResponse = await _repository.getCasts(id);
    _subject.sink.add(castResponse);
  }

  void drainStream(){ _subject.value = null;}

  void dispose()async {
    await _subject.drain();
    _subject.close();
  }


  BehaviorSubject<CastResponse> get subject =>_subject;
}

final castBloc = CastBloc();