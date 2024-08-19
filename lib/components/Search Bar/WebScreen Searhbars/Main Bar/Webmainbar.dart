import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/view/Dashboard%20Screen/dashboard_screen.dart';

import '../../../../Provider/WebView Provider/WebviewProvider.dart';
import '../Widget/Websearchbar.dart';

class WebSearchbar extends StatelessWidget {
  const WebSearchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return Consumer<WebViewProvider>(
      builder: (context, value, child) => Websearchbar(
        focusNode: focusNode,
        onclosetab: () {
          Get.offAll(const DashboardScreen());
          value.focusenode.unfocus();
        },
        onChanged: (v) {
          value.onchanged(v);
        },
        onsubmit: (v) {
          if (v.contains('facebook')) {
            Fluttertoast.showToast(msg: 'Coming Soon.....');
          } else {
            value.GotoSearch(v);
          }
          focusNode.unfocus();
        },
        controller: value.WebSeacrhController,
        onBack: () {
          value.goBack();
          focusNode.unfocus();
          value.focusenode.unfocus();
        },
        onForward: () {
          value.goForward();
          focusNode.unfocus();
          value.focusenode.unfocus();
        },
        OnSearch: () {
          value.GotoSearch(value.WebSeacrhController.text);
          value.focusenode.unfocus();
          focusNode.unfocus();
        },
        ondownload: () {},
        onrefresh: () {
          value.reload();
          value.focusenode.unfocus();
        },
        onremovetext: () {
          value.removetext();
        },
      ),
    );
  }
}
