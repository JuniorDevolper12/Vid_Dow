import 'dart:io';

import 'package:flutter/material.dart';

Widget ThumbnailWidget(String image) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      image: DecorationImage(
        image: FileImage(File(image)),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Center(
      child: Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 30,
      ),
    ),
  );
}
