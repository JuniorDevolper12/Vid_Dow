import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Radio Tiles/RadioTiles.dart';

Widget WatermarkTiles(String choice, Function(String? value) onwatermark,
    Function(String? value) onnowatermark, bool istiktok) {
  return StatefulBuilder(
    builder: (context, setState) {
      return Column(
        children: [
          Row(
            children: [
              QualityRadioTile(
                  title: 'With Watermark',
                  value: 'Watermark',
                  groupValue: choice,
                  onChanged: onwatermark,
                  isenabled: istiktok),
              QualityRadioTile(
                  title: 'No Watermark',
                  value: 'No watermark',
                  groupValue: choice,
                  onChanged: onnowatermark,
                  isenabled: istiktok)
            ],
          ),
          Gap(Get.height * 0.01),
        ],
      );
    },
  );
}
