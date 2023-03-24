import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
      },
      child: Stack(
        children: [
          buildPlay(),
          Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator())
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return VideoProgressIndicator(
      controller,
      allowScrubbing: true,
      padding: const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
      colors: VideoProgressColors(
        playedColor: AppColors.white,
        bufferedColor: AppColors.black.withOpacity(0.5),
        backgroundColor: AppColors.black.withOpacity(0.2),
      ),
    );
  }

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          color: Colors.transparent,
          child: Center(
            child: Icon(
              controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: AppColors.white,
              size: 60,
            ),
          ),
        );
}
