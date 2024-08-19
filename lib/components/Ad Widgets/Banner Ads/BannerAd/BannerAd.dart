import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/Ads%20Providers/BannerAdProvider/BannerAdProvider.dart';

class bannerAd extends StatefulWidget {
  const bannerAd({super.key});

  @override
  State<bannerAd> createState() => _bannerAdState();
}

class _bannerAdState extends State<bannerAd>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<Banneradprovider>(
      builder: (context, value, child) {
        if (value.isloaded) {
          return SizedBox(
            height: Get.height * 0.09,
            width: Get.width,
            child: AdWidget(
              ad: value.bannerAd!,
            ),
          );
        }
        return const Text('');
      },
    );
  }
}

class Bannerad2 extends StatefulWidget {
  const Bannerad2({super.key});

  @override
  State<Bannerad2> createState() => _Bannerad2State();
}

class _Bannerad2State extends State<Bannerad2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<Banneradprovider>(
      builder: (context, value, child) {
        if (value.isloaded2) {
          return SizedBox(
            height: Get.height * 0.09,
            width: Get.width,
            child: AdWidget(
              ad: value.bannerAd2!,
            ),
          );
        }
        return const Text('');
      },
    );
  }
}

class BannerAd3 extends StatefulWidget {
  const BannerAd3({super.key});

  @override
  State<BannerAd3> createState() => _BannerAd3State();
}

class _BannerAd3State extends State<BannerAd3>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<Banneradprovider>(
      builder: (context, value, child) {
        if (value.isloaded3) {
          return SizedBox(
            height: Get.height * 0.09,
            width: Get.width,
            child: AdWidget(
              ad: value.bannerAd3!,
            ),
          );
        }
        return const Text('');
      },
    );
  }
}
