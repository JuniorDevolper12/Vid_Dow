import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../Provider/Ads Providers/BannerAdProvider/BannerAdProvider.dart';
import '../../BannerAd/BannerAd.dart';

Widget DownloadScreenAd() {
  return Consumer<Banneradprovider>(
    builder: (context, value, child) {
      if (value.isloaded2) {
        return Container(
            width: Get.width,
            color: Colors.transparent,
            margin: EdgeInsets.only(top: Get.height * 0.6795),
            child: const Bannerad2());
      } else {
        return Container();
      }
    },
  );
}

Widget ProgressScreenAd() {
  return Consumer<Banneradprovider>(
    builder: (context, value, child) {
      if (value.isloaded) {
        return Container(width: Get.width, child: const bannerAd());
      } else {
        return Container();
      }
    },
  );
}

Widget StatusSceenAd() {
  return Consumer<Banneradprovider>(builder: (context, value, child) {
    if (value.isloaded) {
      return Positioned(
          top: Get.height * 0.63999,
          child: Container(width: Get.width, child: const bannerAd()));
    } else {
      return Container();
    }
  });
}
