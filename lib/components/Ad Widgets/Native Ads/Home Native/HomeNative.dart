import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/Ads Providers/Native Ad Provider/Native Ad Provider.dart';

class HomeNativeAd extends StatefulWidget {
  const HomeNativeAd({super.key});

  @override
  State<HomeNativeAd> createState() => _HomeNativeAdState();
}

class _HomeNativeAdState extends State<HomeNativeAd>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashNativeloader>(context, listen: false)
          .loadsplashnative();
    });
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<SplashNativeloader>(
      builder: (context, value, child) {
        if (value.isAdloaded && value.nativeAd != null) {
          return SizedBox(
            height: Get.height * .285,
            width: Get.width * 0.95,
            child: AdWidget(ad: value.nativeAd!),
          );
        } else {
          return Container(); // Or a loading indicator
        }
      },
    );
  }
}
