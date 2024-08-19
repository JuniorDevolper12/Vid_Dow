import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget AppLogo(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: Get.height * 0.1),
        // Responsive padding
        child: Image(
          image: const AssetImage(
            'images/splash_pic.png',
          ),
          width: Get.width * 1.0, // Responsive image size
          height: Get.height * 0.3, // Responsive image size
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: Get.height * 0.02),
        child: Text(
          'Video Downloader',
          style: TextStyle(
            color: const Color(0xffA660DB),
            fontSize: Get.width * 0.06, // Responsive font size
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSauceOne',
          ),
        ),
      ),
    ],
  );
}
