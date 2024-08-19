import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Ad%20Widgets/Native%20Ads/Social%20Native/SocialNative.dart';
import 'package:video_downloader/utils/App%20Helpers/Snackbar/ShowSnackbar.dart';
import 'package:video_downloader/view/Web%20Views/Webview.dart';

import '../../../utils/App Helpers/Clipboard Helper/Clipboard_helper.dart';
import '../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../Buttons Widgets/Paste button/paste_button.dart';
import '../Enter Url/enter_url.dart';

class DownloaderWidget extends StatefulWidget {
  const DownloaderWidget({
    super.key,
  });

  @override
  State<DownloaderWidget> createState() => _DownloaderWidgetState();
}

class _DownloaderWidgetState extends State<DownloaderWidget> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<Clipboardhelper>(
        builder: (context, value, child) => Column(
          children: [
            const Gap(5),
            EnterUrl(
              focusNode: focusNode,
              onTap: () {},
              controller: value.SearchController,
              onremove: () {
                value.emptytext();
                focusNode.unfocus();
                setState(() {});
              },
            ),
            const Socialnative(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    light: false,
                    title: 'Paste'.tr,
                    onTap: () {
                      focusNode.unfocus();
                      value.Pastefromclipboard();
                    }),
                CustomButton(
                    light: false,
                    title: 'Download'.tr,
                    onTap: () {
                      if (value.SearchController.text.isNotEmpty) {
                        Navhelper.GoWithNavbar(
                            context, WebView(Url: value.SearchController.text));
                      } else {
                        Snackbarhelper.Showsnackbar(
                            'Enter Url', 'Url Cannot Be Empty');
                      }
                      focusNode.unfocus();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
