import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/WebView Provider/WebviewProvider.dart';
import '../../../../utils/App Utils/App Colors/Appcolors.dart';

class Websearchbar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onrefresh;
  final VoidCallback? OnSearch;
  final VoidCallback? onBack;
  final VoidCallback? onForward;
  final VoidCallback? ondownload;
  final VoidCallback? onclosetab;
  final VoidCallback? onMenu;
  final VoidCallback? onremovetext;
  final void Function(String value) onChanged;
  final void Function(String value) onsubmit;
  final FocusNode focusNode;

  const Websearchbar(
      {super.key,
      this.controller,
      this.onrefresh,
      this.onclosetab,
      this.OnSearch,
      this.onBack,
      this.onForward,
      this.ondownload,
      this.onMenu,
      this.onremovetext,
      required this.onChanged,
      required this.onsubmit,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    final Engine = Provider.of<WebViewProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.06,
      width: Get.width * 1,
      decoration: const BoxDecoration(
        color: appColor,
      ),
      child: Row(
        children: [
          const Gap(4),
          SizedBox(
              width: w * .64,
              height: h * 0.04,
              child: Center(
                child: TextField(
                  focusNode: Engine.focusenode,
                  onSubmitted: onsubmit,
                  onChanged: onChanged,
                  controller: controller,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: w * 0.03),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Engine.getSearchEngineIcon(),
                        color: Colors.blue,
                        size: 15,
                      ),
                      contentPadding: EdgeInsets.only(
                          left: h * 0.007,
                          right: h * 0.007,
                          top: h * 0.001,
                          bottom: h * 0.001),
                      hintStyle:
                          TextStyle(fontSize: w * 0.03, color: Colors.grey),
                      hintText: 'Search or paste profile URL'.tr,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: controller!.text.isNotEmpty
                          ? InkWell(
                              onTap: onremovetext,
                              child: Icon(
                                Icons.remove_circle_outline,
                                color: appColor,
                                size: w * 0.05,
                              ),
                            )
                          : null),
                ),
              )),
          const Gap(2),
          InkWell(
            onTap: OnSearch,
            child: SizedBox(
              width: w * .04,
              height: h * .05,
              child: Center(
                  child: Icon(
                Icons.search,
                color: controller!.text.isNotEmpty ? Colors.white : Colors.grey,
              )),
            ),
          ),
          const Gap(10),
          InkWell(
            onTap: onrefresh,
            child: SizedBox(
              width: w * .04,
              height: h * .05,
              child: const Center(
                  child: Icon(
                Icons.refresh,
                color: Colors.white,
              )),
            ),
          ),
          const Gap(10),
          InkWell(
            onTap: onBack,
            child: SizedBox(
              width: w * .04,
              height: h * .05,
              child: Center(
                  child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: w * 0.05,
              )),
            ),
          ),
          const Gap(6),
          InkWell(
            onTap: onForward,
            child: SizedBox(
              width: w * .04,
              height: h * .05,
              child: Center(
                  child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: w * 0.05,
              )),
            ),
          ),
          const Gap(12),
          InkWell(
            onTap: onclosetab,
            child: Center(
                child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: w * 0.06,
            )),
          ),
        ],
      ),
    );
  }
}

//
