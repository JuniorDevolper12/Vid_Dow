import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/Ad Manager/Ad Helper/Adhelper.dart';
import '../../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../../../view/Whatsapp Status Screens/Main Screen/whatsapp_downloader.dart';
import '../../Download Button/download_button.dart';

Widget WhatsappButton(BuildContext context) {
  return Center(
    child: VideoDownloaderButton(
      bgColor: const Color(0xffEAFAE7),
      mainText: 'WhatsApp Status Downloader'.tr,
      bottomText: 'Download Whatsapp Stories & Status'.tr,
      imgColor: const Color(0xff71DB60),
      logoImg: Image.asset('images/whats.png'),
      onTap: () {
        AdUtils.handleAdAndNavigation(
            context,
            (p0) => {
                  Navhelper.GoWithNavbar(
                      context,
                      const WhatsAppDownloaderScreen(
                        isbusiness: false,
                      ))
                });
      },
    ),
  );
}
