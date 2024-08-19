import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../components/Buttons Widgets/Square Button/Buttonswidget.dart';
import '../../../utils/App Helpers/Walpaper Handler/Setwalpaper.dart';

class ViewFullScreenWalpaper extends StatefulWidget {
  final String imageUrl;

  const ViewFullScreenWalpaper({super.key, required this.imageUrl});

  @override
  State<ViewFullScreenWalpaper> createState() => _ViewFullScreenWalpaperState();
}

class _ViewFullScreenWalpaperState extends State<ViewFullScreenWalpaper> {
  final bool _isSettingWallpaper = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fullscreen image
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              fit: BoxFit.fill, // Make image cover entire screen
              placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          Positioned(
            bottom: Get.height * 0.05, // Adjust padding as needed
            right: 0.0,
            left: 0.0,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: RoundButton(
                    loading: _isSettingWallpaper,
                    title: 'Set Wallpaper As'.tr,
                    ontap: () async {
                      showWallpaperLocationDialog(widget.imageUrl, context);
                    })),
          ),
        ],
      ),
    );
  }
}
