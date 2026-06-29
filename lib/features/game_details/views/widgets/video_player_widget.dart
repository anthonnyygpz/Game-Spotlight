import 'package:flutter/material.dart';
import 'package:material3_expressive_loading_indicator/material3_expressive_loading_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatelessWidget {
  final YoutubePlayerController controller;

  const VideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return controller.value.isInitialized
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.6),
                width: 1,
              ),
            ),
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          )
        : SizedBox(
            height: 260,
            child: Center(child: ExpressiveLoadingIndicator(style: .outlined)),
          );
  }
}
