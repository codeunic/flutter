import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/domain/entities/video_post.dart';
import 'package:flutter_application_2/presentation/widgets/shared/video_buttons.dart';
import 'package:flutter_application_2/presentation/widgets/video/fullscreen_player.dart';
import 'package:flutter_application_2/shared/data/local_video_posts.dart';

class VideoSrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoSrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullscreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videourl,
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(
                video: videoPost,
              ),
            ),
          ],
        );
      },
    );
  }
}
