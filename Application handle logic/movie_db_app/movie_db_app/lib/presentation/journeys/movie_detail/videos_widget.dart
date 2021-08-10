import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/common/constants/route_constants.dart';
import 'package:movie_db_app/common/constants/translation_constants.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_cubit.dart';
import 'package:movie_db_app/presentation/blocs/videos/videos_state.dart';
import 'package:movie_db_app/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:movie_db_app/presentation/widgets/button.dart';

class VideosWidget extends StatelessWidget {
  final VideosCubit videosBloc;

  const VideosWidget({Key key, this.videosBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: videosBloc,
        builder: (context, state) {
          if (state is VideosLoaded && state.videos.iterator.moveNext()) {
            final _videos = state.videos;
            return Button(
              text: TranslationConstants.watchTrailers,
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.watchTrailer,
                    arguments: WatchVideoArguments(_videos));
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
