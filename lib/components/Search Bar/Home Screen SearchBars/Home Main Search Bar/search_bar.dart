import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/WebView%20Provider/WebviewProvider.dart';

import '../../../../utils/App Utils/App Colors/Appcolors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onrefresh;
  final FocusNode focusNode;
  final void Function(String value) onsubmit;
  final void Function(String value) onchanged;

  final VoidCallback? onSettings;

  final VoidCallback? Pastefromclipboard;

  final VoidCallback? Onsearch;
  final Widget textremovebutton;

  const CustomSearchBar({
    super.key,
    required this.textremovebutton,
    required this.focusNode,
    required this.onsubmit,
    required this.onchanged,
    this.controller,
    this.onrefresh,
    this.onSettings,
    this.Pastefromclipboard,
    this.Onsearch,
  });

  @override
  Widget build(BuildContext context) {
    final iconhelper = Provider.of<WebViewProvider>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: h * 0.001),
      child: Container(
        height: h * 0.058,
        width: w * 0.89,
        decoration: BoxDecoration(
          color: appColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: Pastefromclipboard,
                    icon: const Icon(
                      Icons.paste,
                      color: Colors.white,
                      size: 20,
                    )),
              ),
            ),
            SizedBox(
                width: w * .68,
                height: h * 0.04,
                child: Center(
                  child: TextField(
                    focusNode: focusNode,
                    onChanged: onchanged,
                    onSubmitted: onsubmit,
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: w * 0.03),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          iconhelper.getSearchEngineIcon(),
                          size: 15,
                          color: Colors.blue,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: h * 0.007,
                            right: h * 0.007,
                            top: h * 0.001,
                            bottom: h * 0.001),
                        hintStyle:
                            TextStyle(fontSize: w * 0.03, color: Colors.grey),
                        hintText: 'Search or paste profile URL'.tr,
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: textremovebutton),
                  ),
                )),
            Positioned(
              right: 18,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: Onsearch,
                  child: SizedBox(
                    width: w * .04,
                    height: h * .05,
                    child: Center(
                        child: Icon(Icons.search,
                            color: controller!.text.isEmpty
                                ? Colors.grey
                                : Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
