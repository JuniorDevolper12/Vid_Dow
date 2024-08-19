import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Provider/WebView Provider/WebviewProvider.dart';
import '../../Buttons Widgets/DropDownButtons/DropDownButtons.dart';
import '../../Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';
import '../../Custom Text Widgets/Subtitle Text/SubtitleTextWIdget.dart';

class SearchEngineWidget extends StatelessWidget {
  const SearchEngineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewProvider>(
      builder: (context, value, child) {
        // value.getengine();
        return InkWell(
          child: ListTile(
            title: CustomText(
              text: 'Search Engine'.tr,
            ),
            subtitle: SubtitleTextWidget(
              subtitle: value.searchengine.contains('google')
                  ? 'Google'
                  : value.searchengine.contains('bing')
                      ? 'Bing'
                      : 'Yahoo',
            ),
            trailing: const DropDownButtons(),
          ),
        );
      },
    );
  }
}
