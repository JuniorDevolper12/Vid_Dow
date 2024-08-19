import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Toast Helper/ToastHelper.dart';

typedef DownloadCompletionCallback = void Function(
    bool success); // Define callback type

Future<void> downloadAndSetWallpaper(String imageUrl,
    {required DownloadCompletionCallback onCompletion,
    required String walpaperLocation}) async {
  final storageStatus = await Permission.storage.request();
  if (!storageStatus.isGranted) {
    return;
  }

  try {
    FileDownloader.downloadFile(
      url: imageUrl,
      name: "walpaper.jpg",
      //(optional)
      onProgress: (String? name, double progress) {
        print('$name $progress');
      },
      onDownloadCompleted: (String path) async {
        if (path.isNotEmpty) {
          if (walpaperLocation != '') {
            if (walpaperLocation == 'Home') {
              await WallpaperManager.setWallpaperFromFile(
                      path, WallpaperManager.HOME_SCREEN)
                  .then((value) => onCompletion(true));
            } else if (walpaperLocation == 'Lock') {
              await WallpaperManager.setWallpaperFromFile(
                      path, WallpaperManager.LOCK_SCREEN)
                  .then((value) => onCompletion(true));
            } else {
              await WallpaperManager.setWallpaperFromFile(
                      path, WallpaperManager.BOTH_SCREEN)
                  .then((value) => onCompletion(true));
            }
          }

          // Call callback on success
        } else {
          onCompletion(false); // Call callback on failure (empty path)
        }
      },
      onDownloadError: (String error) {
        Toasthelper.Showtoast('Error Could Not Set Wallpaper');
        onCompletion(false); // Call callback on error
      },
    );
  } catch (error) {
    print('Error setting wallpaper: $error');
    onCompletion(false); // Call callback on error
  }
}

enum WallpaperLocation { HOME_SCREEN, LOCK_SCREEN, BOTH_SCREEN }

extension WallpaperLocationString on WallpaperLocation {
  String get title {
    switch (this) {
      case WallpaperLocation.HOME_SCREEN:
        return 'Home Screen';
      case WallpaperLocation.LOCK_SCREEN:
        return 'Lock Screen';
      case WallpaperLocation.BOTH_SCREEN:
        return 'Both Screens';
      default:
        return 'Unknown';
    }
  }
}

wallpaperset() {
  Toasthelper.Showtoast('Walpaper Set Succesfully');
}

Future<WallpaperLocation?> showWallpaperLocationDialog(
    String url, BuildContext context) async {
  const options = WallpaperLocation.values;
  TextStyle style =
      TextStyle(fontFamily: 'OpenSauceone', fontSize: 14, color: Colors.black);
  return await showDialog<WallpaperLocation>(
    context: context,
    builder: (context) => SimpleDialog(
      backgroundColor: Colors.white70,
      title: Text(
        'Set Wallpaper As'.tr,
        style: style,
      ),
      children: [
        ListTile(
            leading: const Icon(
                Icons.home), // Replace with your icon for Home Screen
            title: Text(
              options[0].title.tr,
              style: style,
            ),
            onTap: () {
              Get.back();
              downloadAndSetWallpaper(url, onCompletion: (success) {
                wallpaperset();
              }, walpaperLocation: 'Home');
            }),
        ListTile(
            leading: const Icon(
                Icons.lock), // Replace with your icon for Lock Screen
            title: Text(
              options[1].title.tr,
              style: style,
            ),
            onTap: () {
              Get.back();
              downloadAndSetWallpaper(url, onCompletion: (success) {
                wallpaperset();
              }, walpaperLocation: 'Lock');
            }),
        ListTile(
            leading: const Icon(Icons.wallpaper),
            // Replace with your icon for Both Screens
            title: Text(
              options[2].title.tr,
              style: style,
            ),
            onTap: () {
              Get.back();
              downloadAndSetWallpaper(url, onCompletion: (success) {
                wallpaperset();
              }, walpaperLocation: 'Both'); // Return chosen location
            }),
      ],
    ),
  );
}
