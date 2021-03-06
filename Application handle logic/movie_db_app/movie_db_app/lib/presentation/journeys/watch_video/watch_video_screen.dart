import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/constants/translation_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/common/extensions/string_extensions.dart';
import 'package:movie_db_app/data/models/video_entity.dart';
import 'package:movie_db_app/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  const WatchVideoScreen({Key key, @required this.watchVideoArguments})
      : super(key: key);

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  List<VideoEntity> _videos;
  YoutubePlayerController _controller;

  @override
  void initState() {
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.watchTrailers.t(context),
        ),
        // leading: Icon(Icons.arrow_back_ios),
        // centerTitle: true,
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 1; i < _videos.length; i++)
                      Container(
                        height: 60.h,
                        padding:
                            EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.load(_videos[i].key);
                                _controller.play();
                              },
                              child: CachedNetworkImage(
                                width: Sizes.dimen_200.w,
                                imageUrl: YoutubePlayer.getThumbnail(
                                  videoId: _videos[i].key,
                                  quality: ThumbnailQuality.high,
                                ),
                              ),
                            ),
                            Expanded(child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w ),
                              child: Text(_videos[i].title,style: Theme.of(context).textTheme.subtitle1,),
                            ))
                          ],
                        ),
                      )
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
