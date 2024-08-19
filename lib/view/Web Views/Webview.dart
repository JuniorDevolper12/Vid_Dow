import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/Download%20Providers/Download%20Provider/Downloadprovider.dart';
import 'package:video_downloader/Provider/WebView%20Provider/WebviewProvider.dart';
import 'package:video_downloader/components/Gradient%20Widget/Main%20Gradient/Gradient%20Wigdet.dart';
import 'package:video_downloader/components/Progress%20Widget/Progress%20Animation/ProgressAnimation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/Gradient Widget/Floating Gradient/FloatingGradient.dart';
import '../../components/Search Bar/WebScreen Searhbars/Main Bar/Webmainbar.dart';

class WebView extends StatefulWidget {
  final String Url;

  const WebView({super.key, required this.Url});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WebViewProvider>(context, listen: false)
        .initializeWebView(widget.Url);
    Provider.of<VideoDownloadProvider>(context, listen: false)
        .downloadVideo(context, widget.Url);
  }

  @override
  Widget build(BuildContext context) {
    final Web = Provider.of<WebViewProvider>(context, listen: false);
    return GradientColor(
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.04),
        child: Scaffold(
          floatingActionButton: Consumer<VideoDownloadProvider>(
            builder: (context, value, child) {
              if (value.Showdownloadbutton(Web.downloadUrl!)) {
                return FloatingGradient(
                  isloading: value.isloading,
                  ontap: () {
                    if (!value.isloading) {
                      value.downloadVideo(context, Web.downloadUrl!);
                    }
                  },
                );
              }
              return Container();
            },
          ),
          backgroundColor: Colors.transparent,
          body: Consumer<WebViewProvider>(
            builder: (context, value, child) {
              return RefreshIndicator(
                backgroundColor: Colors.blue,
                color: Colors.red,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: () {
                  return value.reload();
                },
                child: Stack(children: [
                  Column(
                    children: [
                      const WebSearchbar(),
                      if (value.isloading) WebProgress(value.progress),
                      Expanded(
                        child: WebViewWidget(
                          controller: value.controller,
                        ),
                      ),
                    ],
                  ),
                  if (value.isloading && value.progress < 0.5)
                    ProgresAnimation(),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
