import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/utils/App%20Utils/App%20Colors/Appcolors.dart';

import '../../../../Provider/Download Providers/Download Provider/Downloadprovider.dart';
import '../../../../utils/App Helpers/Clipboard Helper/Clipboard_helper.dart';
import '../../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../../../utils/App Helpers/Toast Helper/ToastHelper.dart';
import '../../../../view/Web Views/Webview.dart';
import '../Home Main Search Bar/search_bar.dart';

class Homesearchbar extends StatefulWidget {
  const Homesearchbar({super.key});

  @override
  State<Homesearchbar> createState() => _HomesearchbarState();
}

class _HomesearchbarState extends State<Homesearchbar> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final Downloadhelper =
        Provider.of<VideoDownloadProvider>(context, listen: false);
    return Consumer<Clipboardhelper>(
      builder: (context, Pastehelper, child) {
        emptytoast() {
          Toasthelper.Showtoast('Invalid Or Blank Url');
        }

        gotoweb(String url) {
          if (Pastehelper.SearchController.text.contains('facebook.com/post') ||
              Pastehelper.SearchController.text
                  .contains('facebook.com/share') ||
              Pastehelper.SearchController.text
                  .contains('facebook.com/video') ||
              Pastehelper.SearchController.text.contains('facebook.com/reel')) {
            Toasthelper.Showtoast(
                'Video Cannot Be Previewed \n Download Will Be Started.....');
            Downloadhelper.downloadVideo(context, url);
          } else {
            Navhelper.GoWithNavbar(
                context,
                WebView(
                  Url: url,
                ));
          }
        }

        return CustomSearchBar(
          focusNode: _focusNode,
          onchanged: (value) {
            Pastehelper.onchanged(value);
          },
          textremovebutton: Pastehelper.SearchController.text.isNotEmpty
              ? InkWell(
                  onTap: () {
                    Pastehelper.emptytext();
                    _focusNode.unfocus();
                  },
                  child: Icon(
                    Icons.remove_circle,
                    color: appColor,
                    size: Get.width * 0.05,
                  ),
                )
              : const Text(''),
          Pastefromclipboard: () {
            Pastehelper.Pastefromclipboard();
            _focusNode.unfocus();
            // setState(() {});
          },
          onsubmit: (value) {
            if (value.isNotEmpty) {
              _focusNode.unfocus();
              gotoweb(value);
            } else {
              emptytoast();
            }
          },
          controller: Pastehelper.SearchController,
          Onsearch: () {
            _focusNode.unfocus();
            if (Pastehelper.SearchController.text.isNotEmpty) {
              gotoweb(Pastehelper.SearchController.text);
            } else if (Pastehelper.SearchController.text.isEmpty) {
              emptytoast();
            }
          },
        );
      },
    );
  }
}
