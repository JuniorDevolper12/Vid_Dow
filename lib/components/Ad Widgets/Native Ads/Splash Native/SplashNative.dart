import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/Ads Providers/Native Ad Provider/Native Ad Provider.dart';

class Splashnative extends StatefulWidget {
  const Splashnative({super.key});

  @override
  State<Splashnative> createState() => _SplashnativeState();
}

class _SplashnativeState extends State<Splashnative>
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
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<SplashNativeloader>(
      builder: (context, value, child) {
        if (value.isAdloaded2) {
          return Padding(
            padding: EdgeInsets.only(top: Get.height * 0.03),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: Get.height * 0.358,
              width: Get.width * 0.95,
              child: AdWidget(ad: value.nativeAd2!),
            ),
          );
        } else {
          return Container(
            height: Get.height * 0.38,
          ); // Or a loading indicator
        }
      },
    );
  }
}
