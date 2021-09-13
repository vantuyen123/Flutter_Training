import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:i_game_database/bloc/get_game_bloc.dart';
import 'package:i_game_database/elements/error_element.dart';
import 'package:i_game_database/elements/loader_element.dart';
import 'package:i_game_database/model/game.dart';
import 'package:i_game_database/model/game_response.dart';
import 'package:i_game_database/style/theme.dart' as Style;

class DiscoverScreenList extends StatefulWidget {
  @override
  _DiscoverScreenListState createState() => _DiscoverScreenListState();
}

class _DiscoverScreenListState extends State<DiscoverScreenList> {
  @override
  void initState() {
    getGameBloc..getGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, AsyncSnapshot<GameResponse> snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data!.error.isNotEmpty &&
            snapshot.data!.error.length > 0) {
          return buildErrorWidget(snapshot.data!.error.toString());
        }
        return _builGameListWidget(snapshot.data);
      } else if (snapshot.hasError) {
        return buildErrorWidget(snapshot.error.toString());
      } else {
        return buildLoadingWidget();
      }
    });
  }

  Widget _builGameListWidget(GameResponse? data) {
    List<GameModel> games = data!.games;
    if (games.length == 0) {
      return Text("No Games");
    } else {
      return AnimationLimiter(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              duration: Duration(milliseconds: 400),
              position: index,
              child: SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: Row(
                        children: [
                          Hero(
                            tag: games[index].id,
                            child: AspectRatio(
                              aspectRatio: 3 / 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://images.igdb.com/igdb/image/upload/t_cover_big/${games[index].cover.imageId}.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      games[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(.2),
                                          fontSize: 14),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      games[index].sumary,
                                      maxLines: 4,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(.2),
                                          fontSize: 12
                                        ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 6,
                                      initialRating: games[index].rating / 20,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                      itemBuilder: (context, _) => Icon(
                                        EvaIcons.star,
                                        color: Style.Colors.secondaryColor,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Text(
                                      (games[index].rating / 20)
                                          .toString()
                                          .substring(0, 3),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: games.length,
        ),
      );
    }
  }
}
