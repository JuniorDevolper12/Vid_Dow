import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/utils/App%20Utils/App%20Colors/Appcolors.dart';

import '../../../Provider/Walpaper Provider/WalpaperProvider.dart';

Widget WallpaperSearchbar() {
  return Consumer<PhotosProvider>(
    builder: (context, value, child) {
      FocusNode focusNode = FocusNode();
      if (value.showsearch) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: Get.height * 0.055,
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextField(
                onChanged: (v) {
                  value.newvalue(v);
                },
                controller: value.SearchController,
                onSubmitted: (v) {
                  value.GotoSearch(v);
                  focusNode.unfocus();
                },
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    prefixIcon: IconButton(
                      icon: Icon(
                        value.SearchController.text.isEmpty
                            ? Icons.wallpaper
                            : Icons.remove_circle,
                        color: appColor,
                        size: 20,
                      ),
                      onPressed: () {
                        if (value.SearchController.text.isNotEmpty) {
                          value.removesearch();
                        }
                      },
                    ),
                    hintText: 'Search For Wallpapers',
                    suffixIcon: IconButton(
                        onPressed: () {
                          value.GotoSearch(value.SearchController.text);
                          focusNode.unfocus();
                        },
                        icon: Icon(
                          Icons.search_outlined,
                          color: value.SearchController.text.isEmpty
                              ? Colors.grey
                              : appColor,
                          size: 20,
                        )),
                    hintStyle:
                        const TextStyle(fontFamily: 'OpenSauceone', fontSize: 13),
                    contentPadding: const EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: appColor, width: 2),
                        borderRadius: BorderRadius.circular(11)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
        );
      }
      return Container();
    },
  );
}
