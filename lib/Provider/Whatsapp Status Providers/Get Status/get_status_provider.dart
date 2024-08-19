import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_downloader/utils/App%20Helpers/Toast%20Helper/ToastHelper.dart';

import '../../../utils/App Utils/App Constants/constants.dart';

class GetStatusProvider with ChangeNotifier {
  List<FileSystemEntity> _getImages = [];
  List<FileSystemEntity> _getVideos = [];
  bool _isWhatsappOn = false;
  bool _hasFetchedVideos = false;
  bool _isBusinessDirectorySelected = false;

  List<FileSystemEntity> get getImages => _getImages;

  List<FileSystemEntity> get getVideos => _getVideos;

  bool get isWhatsappOn => _isWhatsappOn;

  //select directory by user choice
  void selectDirectory(bool isBusinessDirectory) {
    _isBusinessDirectorySelected = isBusinessDirectory;
    log("Selected directory: ${_isBusinessDirectorySelected ? 'WhatsApp Business' : 'WhatsApp'}");
    _hasFetchedVideos = false;
    notifyListeners();
  }

//select directory on device preferance
  Future<String> getProperWhatsAppPath() async {
    String path;
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var sdkInt = androidInfo.version.sdkInt;
      if (sdkInt >= 29) {
        // Android 10 and above
        path = _isBusinessDirectorySelected
            ? VdConstants.WHATSAPP_Business_PATH
            : VdConstants.WHATSAPP_PATH;
      } else {
        // Android 9 and below
        path = _isBusinessDirectorySelected
            ? VdConstants.WHATSAPP_BUSINESS_PATH_ANDROID_9
            : VdConstants.WHATSAPP_PATH_ANDROID_9;
      }
    } else {
      throw UnsupportedError("Unsupported platform");
    }
    return path;
  }

  void getStatus(String exten) async {
    var status = await Permission.manageExternalStorage.request();

    if (status.isDenied) {
      Toasthelper.Showtoast('Permission Denied');
      return;
    }

    if (status.isGranted) {
      //getting the directory from the method
      String path = await getProperWhatsAppPath();
      final directory = Directory(path);

      if (directory.existsSync()) {
        final items = directory.listSync();
        if (!_hasFetchedVideos) {
          if (exten == ".mp4") {
            final videosList = items
                .where((element) => element.path.endsWith(".mp4"))
                .toList();
            _getVideos = videosList.cast<File>();
            _hasFetchedVideos = true;
            notifyListeners();
          }
        }
        log("WhatsApp status directory exists: ${directory.path}");

        if (exten == ".jpg") {
          _getImages =
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
