import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_game_database/bloc/get_slider_bloc.dart';
import 'package:i_game_database/elements/error_element.dart';
import 'package:i_game_database/elements/loader_element.dart';
import 'package:i_game_database/model/game.dart';
import 'package:i_game_database/model/game_response.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:i_game_database/style/theme.dart' as Style;

class HomeSlider extends StatefulWidget {

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  PageController pageController = PageController(
      viewportFraction: 1,
      keepPage: true
  );

  @override
  void initState() {
    getSliderBloc..getSlider(38);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getSliderBloc.subject.stream,
        builder: (context, AsyncSnapshot<GameResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error.isNotEmpty &&
                snapshot.data!.error.length > 0) {
              return buildErrorWidget(snapshot.data!.error);
            }
            return _buildHomeSliderWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.error.toString());
          } else {
            return buildLoadingWidget();
          }
        });
  }

  Widget _buildHomeSliderWidget(GameResponse? data) {
    List<GameModel> games = data!.games;
    return Container(
      height: 180,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        length: games
            .take(5)
            .length,
        child: PageView.builder(
          controller: pageController,
          itemCount: games
              .take(5)
              .length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Stack(
                  children: [
                    Hero(
                      tag: games[index].id,
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.igdb.com/igdb/upload/t_screenshot_huge/${games[index]
                                        .screenshots[0].imageId}.jpg"
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [
                                0.0,
                                0.9
                              ],
                              colors: [
                                Color(0xFF20232A).withOpacity(1.0),
                                Style.Colors.backgroundColor.withOpacity(0.0)
                              ]

                          )
                      ),
                    ),
                    Positioned(

                      left: 10,
                      bottom: 0.0,
                      child: Container(
                        height: 90,
                        child: AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://images.igdb.com/igdb/image/upload/t_cover_big/${games[index]
                                          .cover.imageId}.jpg"
                                  ),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ),
                      ),),
                    Positioned(
                      bottom: 30,
                      left: 80,
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              games[index].name,
                              style: TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            )
                          ],
                        ),
                      ),),

                  ]

              ),
            );
          },
        ),
        shape: IndicatorShape.circle(size: 5),

        indicatorColor: Style.Colors.mainColor,
        indicatorSelectorColor: Style.Colors.secondaryColor,
      ),
    );
  }
}