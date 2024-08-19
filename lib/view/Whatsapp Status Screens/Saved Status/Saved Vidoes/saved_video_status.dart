import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SavedStatusVideoViewScreen extends StatefulWidget {
  final String? videoPath;

  const SavedStatusVideoViewScreen({super.key, this.videoPath});

  @override
  State<SavedStatusVideoViewScreen> createState() =>
      _SavedStatusVideoViewScreenState();
}

class _SavedStatusVideoViewScreenState
    extends State<SavedStatusVideoViewScreen> {
  ChewieController? _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController:
          VideoPlayerController.file(File(widget.videoPath!)),
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      aspectRatio: 4 / 6,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController!.pause();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Chewie(
        controller: _chewieController!,
      ),
    );
  }
}
