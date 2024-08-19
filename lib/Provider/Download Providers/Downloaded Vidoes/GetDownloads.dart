import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoInfo {
  final String path;
  final String name;

  VideoInfo({required this.path, required this.name});
}

class AudioInfo {
  final String path;
  final String name;

  AudioInfo({required this.path, required this.name});
}

class GetDownloads with ChangeNotifier {
  List<VideoInfo> _videos = [];
  List<AudioInfo> _audios = [];
  List<VideoInfo> get videos => _videos;
  List<AudioInfo> get audios => _audios;
  final List<String> audioExtensions = [
    '.mp3',
    '.m4a',
    '.aac',
    '.wav',
    '.wma',
    '.ogg',
    '.flac',
    '.alac'
  ];

  Future<void> fetchAndAddVideos() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var sdkInt = androidInfo.version.sdkInt;
    if (sdkInt > 33) {
      await Permission.videos.request();
      await Permission.manageExternalStorage.request();
    } else {
      final status = await Permission.storage.request();
    }
    final directory =
        Directory('/storage/emulated/0/Download/Video Downloader');
    if (directory.existsSync()) {
      final items = await directory.list().toList();
      final videosList = items.where((element) {
        return element.path.endsWith(".mp4") &&
            element.path.contains("_by_video_downloader");
      }).toList();

      // Sort the video list by last modified time
      videosList.sort((a, b) {
        final aFile = File(a.path);
        final bFile = File(b.path);
        return bFile.lastModifiedSync().compareTo(aFile.lastModifiedSync());
      });

      // Map the video files to VideoInfo objects and update the list
      _videos = videosList
          .map((video) =>
              VideoInfo(path: video.path, name: video.path.split('/').last))
          .toList();
      notifyListeners();

      // Log the found items for debugging
      log("Download directory exists: ${directory.path}");
      for (var item in items) {
        if (item is File) {
          log("Found video file: ${item.path}");
        } else if (item is Directory) {
          log("Found subdirectory: ${item.path}");
        }
      }
    } else {
      log("Download directory does not exist.");
    }
  }

  Future<void> fetchAndAddAudios() async {
    final directory =
        Directory('/storage/emulated/0/Download/Video Downloader');
    if (directory.existsSync()) {
      final items = await directory.list().toList();
      final audiosList = items.where((element) {
        return audioExtensions
                .any((ext) => element.path.toLowerCase().endsWith(ext)) &&
            element.path.contains("_by_video_downloader");
      }).toList();
      audiosList.sort((a, b) {
        final aFile = File(a.path);
        final bFile = File(b.path);
        return bFile.lastModifiedSync().compareTo(aFile.lastModifiedSync());
      });
      _audios = audiosList
          .map((audio) =>
              AudioInfo(path: audio.path, name: audio.path.split('/').last))
          .toList();
      notifyListeners();
      log("Download directory exists: ${directory.path}");
      for (var item in audiosList) {
        log("Found audio file: ${item.path}");
      }
    } else {
      log("Download directory does not exist.");
    }
  }
}
