import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/Ad%20Widgets/Native%20Ads/Home%20Native/HomeNative.dart';

import '../../components/Buttons Widgets/Social Medias Buttons/SocialMedias.dart';
import '../../components/Buttons Widgets/Wallpaper Button/Home Wallpaper button/WallpaperButton.dart';
import '../../components/Buttons Widgets/Whatsapp Button/Home Whatsapp Button/WhatsappButton.dart';
import '../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../components/Search Bar/Home Screen SearchBars/HomesearchBar/Homesearchbar.dart';
import '../../utils/Methods/Navigation Methods/NavigationMethods.dart';
import '../Settings Screen/SettingsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: GradientColor(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              titleTextStyle: const TextStyle(
                  fontFamily: 'OpenSauceOne',
                  color: Colors.black,
                  fontSize: 16),
              backgroundColor: Colors.transparent,
              title: Text('Video Downloader'.tr),
              automaticallyImplyLeading: false,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      ChangeScreen().Goto(SettingScreen());
                    });
                  },
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const Homesearchbar(),
                    Gap(Get.height * 0.03),
                    SocialMedias(),
                    Gap(Get.height * 0.01),
                    const HomeNativeAd(),
                    Gap(Get.height * 0.01),
                    WhatsappButton(context),
                    WallpaperButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
