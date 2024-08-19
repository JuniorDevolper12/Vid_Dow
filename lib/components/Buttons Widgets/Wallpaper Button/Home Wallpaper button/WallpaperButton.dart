import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/Ad Manager/Ad Helper/Adhelper.dart';
import '../../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../../../view/Walpaper Screens/Main Screen/Wallpaper_download_screen.dart';
import '../../Download Button/download_button.dart';

Widget WallpaperButton(BuildContext context) {
  return Center(
    child: VideoDownloaderButton(
      bgColor: const Color(0xffDCF8FA),
      mainText: 'Wallpaper Downloader'.tr,
      bottomText: 'Download Varity of Wallpapers'.tr,
      imgColor: const Color(0xff12D1DB),
      logoImg: Image.asset(
        'images/wallp.png',
        width: 30,
      ),
      onTap: () {
        AdUtils.handleAdAndNavigation(
            context,
            (p0) => {
                  Navhelper.GoWithNavbar(
                      context, const WallpaperDownloaderScreen())
                });
      },
    ),
  );
}
