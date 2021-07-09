import 'package:movie_app/model/video_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieVideoBloc{
  final MovieRepository _repository = MovieRepository();

  final BehaviorSubject<VideoResponse> _subject = BehaviorSubject<VideoResponse>();

  getVideos(int id) async{
    VideoResponse response = await _repository.getMovieVideos(id);
    _subject.sink.add(response);
  }

  void drainStream(){_subject.value = null;}

  void dispose() async{
    await _subject.drain();
    _subject.close();
  }
  BehaviorSubject<VideoResponse> get subject => _subject;
}
final movieVideoBloc = MovieVideoBloc();