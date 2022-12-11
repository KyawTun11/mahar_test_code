import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);
  String? videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(widget.videoUrl!),
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: true,
      autoInitialize: true,
      showControlsOnInitialize: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Chewie(controller: _chewieController);
  }
}