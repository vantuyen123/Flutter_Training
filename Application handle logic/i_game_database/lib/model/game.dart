import 'package:i_game_database/model/game_models/Screen_shot.dart';
import 'package:i_game_database/model/game_models/cover.dart';
import 'package:i_game_database/model/game_models/genre.dart';
import 'package:i_game_database/model/game_models/mode.dart';
import 'package:i_game_database/model/game_models/player_perspective.dart';
import 'package:i_game_database/model/game_models/video.dart';

class GameModel {
  final int id;
  final CoverModel cover;
  final int createAt;
  final int firstRelease;
  final List<ModeModel> modes;
  final List<GenreModel> genres;
  final List<PlayerPerspectiveModel> prespectives;
  final double popuparity;
  final List<ScreenShotModel> screenshots;
  final String sumary;
  final List<VideoModel> videos;
  final double rating;
  final String name;

  GameModel(
      this.id,
      this.cover,
      this.createAt,
      this.firstRelease,
      this.modes,
      this.genres,
      this.prespectives,
      this.popuparity,
      this.screenshots,
      this.sumary,
      this.videos,
      this.rating,
      this.name);

  GameModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        cover = json["cover"],
        createAt = json["created_at"],
        firstRelease = json["first_release_date"],
        modes = (json["game_modes"] as List)
            .map((e) => ModeModel.fromJson(e))
            .toList(),
        genres = (json["genres"] as List)
            .map((e) => GenreModel.fromJson(e))
            .toList(),
        prespectives = (json["player_perspectives"] as List)
            .map((e) => PlayerPerspectiveModel.fromJson(e))
            .toList(),
        popuparity = json["popularity"],
        screenshots = (json["screenshots"] as List)
            .map((e) => ScreenShotModel.fromJson(e))
            .toList(),
        sumary = json["sumary"],
        videos = (json["videos"] as List)
            .map((e) => VideoModel.fromJson(e))
            .toList(),
        rating = json["rating"],
        name = json["name"];
}
