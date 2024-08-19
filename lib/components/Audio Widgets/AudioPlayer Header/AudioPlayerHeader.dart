import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';

Widget AudioPlayerHeader() {
  return Container(
      margin: EdgeInsets.only(top: Get.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(text: 'Now Playing'),
          Container(
            width: 10,
          ),
          const Icon(
            Icons.music_note,
            color: Colors.blue,
            size: 25,
          )
        ],
      ));
}
