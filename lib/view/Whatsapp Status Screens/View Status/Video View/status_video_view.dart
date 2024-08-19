import 'dart:developer';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/App Utils/App Colors/Appcolors.dart';
import '../../../../utils/App Utils/App Constants/constants.dart';

class StatusVideoViewScreen extends StatefulWidget {
  final String? videoPath;

  const StatusVideoViewScreen({super.key, this.videoPath});

  @override
  State<StatusVideoViewScreen> createState() => _StatusVideoViewScreenState();
}

class _StatusVideoViewScreenState extends State<StatusVideoViewScreen> {
  Future<String> createFolder(
      String mainFolderName, String saveFolderName) async {
    // Get the application documents directory
    //final appDocumentsDir = await getExternalStorageDirectory();
    final directory = Directory(VdConstants.saveImage);
    // Create the folder path
    final folderPath = '${directory.path}/$mainFolderName/$saveFolderName';

    // Create the folder if it doesn't exist
    if (!Directory(folderPath).existsSync()) {
      Directory(folderPath).createSync(recursive: true);
    }
    log(folderPath);

    return folderPath;
  }

  ChewieController? _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
      placeholder: const Center(child: CircularProgressIndicator()),
      allowPlaybackSpeedChanging: false,
      videoPlayerController:
          VideoPlayerController.file(File(widget.videoPath!)),
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      aspectRatio: 5 / 6,
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.08),
        child: Chewie(
          controller: _chewieController!,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColor,
        foregroundColor: Colors.white,
        onPressed: () async {
          const mainfolderName = 'Video Downloader';
          const savefolderName = 'Statuses'; // Specify the folder name
          final folderPath = await createFolder(mainfolderName, savefolderName);
          final originalVideoName = widget.videoPath!.split('/').last;
          final newVideoPath = '$folderPath/$originalVideoName';

          final File originalVideoFile = File(widget.videoPath!);
          final File newVideoFile = await originalVideoFile.copy(newVideoPath);
          log(newVideoFile.path);
          ImageGallerySaver.saveFile(newVideoFile.path)
              .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Video Saved')),
                  ));
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
