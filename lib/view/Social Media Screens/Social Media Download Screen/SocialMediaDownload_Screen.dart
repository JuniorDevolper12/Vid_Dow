import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/App Widgets/Custom App Bars/customAppbar.dart';
import '../../../components/Download Widgets/Social Downloader/SocialDownloader.dart';

class SocialMediaDownloadScreen extends StatefulWidget {
  final String appbartitle;

  const SocialMediaDownloadScreen({super.key, required this.appbartitle});

  @override
  State<SocialMediaDownloadScreen> createState() =>
      _SocialMediaDownloadScreenState();
}

class _SocialMediaDownloadScreenState extends State<SocialMediaDownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: widget.appbartitle.tr),
      body: const DownloaderWidget(),
    );
  }
}
