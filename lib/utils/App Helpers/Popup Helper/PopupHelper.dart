import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Audio Provider/AudioProvider.dart';
import '../../../Provider/Download Providers/Downloaded Vidoes/GetDownloads.dart';
import '../../../view/Media Players/Audio Player/AudioPlayer.dart';
import '../../../view/Media Players/VideoPlayer/VideoPlayer.dart';
import '../Delete Helper/Delete Helper.dart';
import '../Navbarhelper/GowithNavbar.dart';
import '../Share helper/ShareHelper.dart';

class Popuphelper {
  static void AudioOptions(String value, VoidCallback ondelete,
      BuildContext context, String path, String name) {
    if (value.contains('play')) {
      Provider.of<AudioPlayerProvider>(context, listen: false).play(path);
      Get.to(AudioPlayerScreen(
        audiopath: path,
        audioname: name,
        audioid: 0,
      ));
    }
    if (value.contains('delete')) {
      Deletehelper.deleteFile(path);
      ondelete();
    }
    if (value.contains('share')) {
      Sharehelper.Sharefile(path, name);
    }
  }

  static PopupFunctions(
      String value, BuildContext context, String videopath, String videoname) {
    if (value.contains('play')) {
      Navhelper.GoWithoutNavbar(
          context,
          Videoplayer(
            videoPath: videopath,
          ));
    }
    if (value.contains('share')) {
      Sharehelper.Sharefile(videopath, videoname);
    }
    if (value.contains('delete')) {
      print('tapped');
      Deletehelper.deleteFile(videopath);
      Provider.of<GetDownloads>(context, listen: false).fetchAndAddVideos();
    }
  }
}
