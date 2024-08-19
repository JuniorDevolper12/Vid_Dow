import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Ad%20Widgets/Banner%20Ads/AdContainers/Downloads%20Screen%20Ad/Download%20Screen%20Ad.dart';
import 'package:video_downloader/components/Custom%20Text%20Widgets/Custom%20Text%20Widget/CustomTextWidget.dart';
import 'package:video_downloader/utils/Methods/Navigation%20Methods/NavigationMethods.dart';
import 'package:video_downloader/view/Dashboard%20Screen/dashboard_screen.dart';

import '../../../Provider/Download Providers/Download Provider/Downloadprovider.dart';
import '../../../components/Download Widgets/No Downloads/No_Downloads.dart';
import '../../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../../components/Progress Widget/DownloadProgress/Progress_widget.dart';

class Progress_Screen extends StatefulWidget {
  const Progress_Screen({super.key});

  @override
  State<Progress_Screen> createState() => _Progress_ScreenState();
}

class _Progress_ScreenState extends State<Progress_Screen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        ChangeScreen().OffAll(const DashboardScreen());
      },
      canPop: false,
      child: GradientColor(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leadingWidth: 30,
              title: const CustomText(
                text: "Progress",
              ),
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    ChangeScreen().OffAll(const DashboardScreen());
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20,
                  )),
            ),
            body: Consumer<VideoDownloadProvider>(
              builder: (BuildContext context, VideoDownloadProvider value,
                  Widget? child) {
                return Stack(
                  children: [
                    StreamBuilder<BoxEvent>(
                      stream:
                          Hive.box<Map<dynamic, dynamic>>('downloads').watch(),
                      builder: (context, snapshot) {
                        var box = Hive.box<Map<dynamic, dynamic>>(
                            'downloads'); // Access the opened box
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const No_Downloads_Widget();
                        } else if (snapshot.hasError) {
                          return const Center(child: No_Downloads_Widget());
                        } else {
                          var downloads = box.values.toList();
                          if (downloads.isEmpty) {
                            return const Center(child: No_Downloads_Widget());
                          } else {
                            return ListView.builder(
                              itemCount: downloads.length,
                              itemBuilder: (context, index) {
                                final download = downloads[index];
                                return ProgressWidget(
                                    thumbnail: download['thumbnailImage'],
                                    isaudio: value.isselaudio,
                                    videoname: download['videoname'],
                                    progress: download['progress'],
                                    downloadid: download['downloadId']);
                              },
                            );
                          }
                        }
                      },
                    ),
                    Positioned(
                      bottom: Get.height * 0.054,
                      left: 0,
                      right: 0,
                      child: ProgressScreenAd(),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
