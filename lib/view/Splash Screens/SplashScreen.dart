import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/Ads%20Providers/BannerAdProvider/BannerAdProvider.dart';

import '../../Provider/Ads Providers/Native Ad Provider/Native Ad Provider.dart';
import '../../components/Ad Widgets/AdWarning/AdWarning.dart';
import '../../components/AnimationContainer/AnimationContainer.dart';
import '../../components/Custom Text Widgets/AniminatedText/Animinatedtext.dart';
import '../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SplashNativeloader>(context, listen: false).loadallads();
    Provider.of<Banneradprovider>(context, listen: false).loadbannerAd();
    Provider.of<Banneradprovider>(context, listen: false).loadbannerAd2();
    Provider.of<Banneradprovider>(context, listen: false).loadbannerAd3();
  }

  @override
  Widget build(BuildContext context) {
    return const GradientColor(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimationContainer(),
                AniminatedText(),
                AdWarning(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
