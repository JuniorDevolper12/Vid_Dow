import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setLanguage(BuildContext context, String languageCode) async {
  final locale = Locale('en', languageCode);
  Get.updateLocale(locale).then((_) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }).catchError((error) {
    print(error);
  });
}

void langaugechange(String lanaguage) {
  if (lanaguage == 'English' || lanaguage == 'Default') {
    Get.updateLocale(const Locale('en,english'));
  } else if (lanaguage == 'Urdu') {
    Get.updateLocale(const Locale('en,urdu'));
  }
}
