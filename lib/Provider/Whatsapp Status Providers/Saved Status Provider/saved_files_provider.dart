import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/App Utils/App Constants/constants.dart';

class SavedStatusProvider with ChangeNotifier {
  List<FileSystemEntity> _getFiles = [];

  // List<FileSystemEntity> _getVideos = [];

  bool _isWhatsappOn = false;

  List<FileSystemEntity> get getFiles => _getFiles;

  // List<FileSystemEntity> get getVideos => _getVideos;

  bool get isWhatsappOn => _isWhatsappOn;

  void getStatus(String exten) async {
    var status = await Permission.manageExternalStorage.request();

    if (status.isDenied) {
      Fluttertoast.showToast(
        msg: 'Permission Denied',
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    }

    if (status.isGranted) {
      final directory = Directory(VdConstants.saveFilesPath);

      if (directory.existsSync()) {
        log("WhatsApp status directory exists: ${directory.path}");

        // List all files and directories within the status directory
        final items = directory.listSync();

        if (exten == ".mp4" && exten == ".mp4") {
          _getFiles =
              items.where((element) => element.path.endsWith(".mp4")).toList();
          notifyListeners();
          _getFiles +=
              items.where((element) => element.path.endsWith(".jpg")).toList();
          notifyListeners();
        }

        _isWhatsappOn = true;
        notifyListeners();

        for (var item in items) {
          if (item is File) {
            // Process individual status files here
            log("Found status file: ${item.path}");
          } else if (item is Directory) {
            // Handle directories (if needed)
            log("Found subdirectory: ${item.path}");
          }
        }
      } else {
        log("WhatsApp status directory does not exist.");

        _isWhatsappOn = true;
        notifyListeners();
      }
    } else {
      Fluttertoast.showToast(
        msg: 'No status image found',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}
