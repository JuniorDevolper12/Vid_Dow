import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget ThumbnailWidget(String Thumbnail) {
  return Container(
    width: 100,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Thumbnail.isEmpty
        ? Image.asset(
            'images/image.png',
            height: Get.height * 0.01,
            width: Get.width * 0.87,
          )
        : SizedBox(
            height: Get.height * 0.01,
            width: Get.width * 0.87,
            child: Image.network(Thumbnail)),
  );
}

Widget Videoname(String name) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 4),
    child: Text(
      maxLines: 1,
      name,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 13.4,
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSauceOne',
      ),
    ),
  );
}

Widget Underline() {
  return Padding(
    padding: EdgeInsets.only(left: Get.width * 0.279),
    child: Container(
      height: 1,
      width: Get.width * 0.82,
      color: Colors.red,
    ),
  );
}
