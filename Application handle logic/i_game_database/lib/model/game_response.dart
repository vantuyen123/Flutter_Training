import 'package:i_game_database/model/game.dart';

class GameResponse {
  final List<GameModel> games;
  final String error;

  GameResponse(this.games, this.error);

  GameResponse.fromJson(List json)
      : games = json.map((e) => GameModel.fromJson(e)).toList(),
        error = "";

  GameResponse.withError(String errorValue)
      : games = [],
        error = errorValue;
}
