import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Ad%20Widgets/Ad%20Container/ad_container.dart';

import '../../../../Provider/Ads Providers/Native Ad Provider/Native Ad Provider.dart';

class Socialnative extends StatefulWidget {
  const Socialnative({super.key});

  @override
  State<Socialnative> createState() => _SocialnativeState();
}

class _SocialnativeState extends State<Socialnative>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashNativeloader>(context, listen: false)
          .loadsplashnative3();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<SplashNativeloader>(
      builder: (context, value, child) {
        if (value.isAdloaded3 && value.nativeAd3 != null) {
          return SizedBox(
            height: Get.height * 0.355,
            width: Get.width * 0.95,
            child: AdWidget(ad: value.nativeAd3!),
          );
        } else {
          return const AdContainer(); // Or a loading indicator
        }
      },
    );
  }
}
