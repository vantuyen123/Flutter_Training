import 'package:i_game_database/model/game_response.dart';
import 'package:i_game_database/repositories/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSliderBloc{
  final GameRepository _repository = GameRepository();
  final BehaviorSubject<GameResponse> _subject = BehaviorSubject<GameResponse>();

  getSlider(int platformId) async{
    GameResponse response = await _repository.getSlider(platformId);
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }
}

final getSliderBloc = GetSliderBloc();