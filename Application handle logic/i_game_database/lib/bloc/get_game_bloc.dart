import 'package:i_game_database/model/game_response.dart';
import 'package:i_game_database/repositories/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetGameBloc{
  final GameRepository _repository = GameRepository();
  final BehaviorSubject<GameResponse> _subject = BehaviorSubject<GameResponse>();

  getGame() async{
    GameResponse response = await _repository.getGames();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<GameResponse> get subject => subject;
}

final getGameBloc = GetGameBloc();