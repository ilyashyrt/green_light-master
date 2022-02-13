import 'package:flutter/material.dart';
import 'package:greenlife/src/constants/strings.dart';
import 'package:greenlife/src/ui/video/source/video_items.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoScreen extends StatelessWidget {
  String videoExtension;
  VideoScreen(this.videoExtension);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.videoPlayerText),
      ),
      body: ListView(
        children: [
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              videoExtension,
            ),
            looping: true,
          ),
        ],
      ),
    );
  }
}
