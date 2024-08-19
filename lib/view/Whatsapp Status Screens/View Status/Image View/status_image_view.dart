import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../../../../utils/App Utils/App Colors/Appcolors.dart';
import '../../../../utils/App Utils/App Constants/constants.dart';

class StatusImageViewScreen extends StatefulWidget {
  final String? imagePath;

  const StatusImageViewScreen({super.key, this.imagePath});

  @override
  State<StatusImageViewScreen> createState() => _StatusImageViewScreenState();
}

class _StatusImageViewScreenState extends State<StatusImageViewScreen> {
  Future<String> createFolder(
      String mainFolderName, String saveFolderName) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.06),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: FileImage(
                File(widget.imagePath!),
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColor,
        foregroundColor: Colors.white,
        onPressed: () async {
          const mainfolderName = 'Video Downloader';
          const savefolderName = 'Statuses'; // Specify the folder name
          final folderPath = await createFolder(mainfolderName, savefolderName);
          final originalImageName = widget.imagePath!.split('/').last;
          final newImagePath = '$folderPath/$originalImageName';

          final File originalImageFile = File(widget.imagePath!);
          final File newImageFile = await originalImageFile.copy(newImagePath);
          // );
          log(newImageFile.path);
          ImageGallerySaver.saveFile(newImageFile.path)
              .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Image Saved')),
                  ));
        },
        child: const Icon(
          Icons.download,
        ),
      ),
    );
  }
}
