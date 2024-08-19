import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_downloader/utils/App%20Helpers/Permissions%20Helper/Permissions%20Helper.dart';
import 'package:video_downloader/view/Splash%20Screens/SplashScreen.dart';

import 'Provider/All Providers/All_Providers.dart';
import 'utils/Ad Manager/Interstial Ad Controller/InterstialAdController.dart';
import 'utils/App Helpers/Langauge Helper/Translations/AppLangauges.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox<Map<dynamic, dynamic>>('downloads');
  await PermissionsHelper.getpermissions();
  final prefs = await SharedPreferences.getInstance();
  final savedLanguage = prefs.getString('language');
  runApp(Video_Downloader(
    Langauge: savedLanguage,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  AdManager.loadInterstitialAd();
}

class Video_Downloader extends StatelessWidget {
  final String? Langauge;

  const Video_Downloader({super.key, this.Langauge});

  @override
  Widget build(BuildContext context) {
    return AllProviders(
      context,
      GetMaterialApp(
          fallbackLocale: const Locale('en,english'),
          translations: AppLangauges(),
          locale: Locale('en', Langauge),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const Splash_Screen()),
    );
  }
}
