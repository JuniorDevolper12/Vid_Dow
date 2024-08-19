import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../../utils/App Helpers/Snackbar/ShowSnackbar.dart';
import '../../../view/Web Views/Webview.dart';

class EnterUrl extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final VoidCallback onremove;

  const EnterUrl(
      {super.key,
      required this.onTap,
      required this.controller,
      required this.focusNode,
      required this.onremove});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.12,
        width: Get.width * 0.92,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Enter Url here'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const Gap(8),
                SizedBox(
                  height: Get.height * 0.054,
                  width: Get.width * 0.86,
                  child: TextField(
                    focusNode: focusNode,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        Navhelper.GoWithNavbar(
                            context,
                            WebView(
                              Url: value,
                            ));
                      } else {
                        Snackbarhelper.Showsnackbar(
                            'Enter Url', 'Url Cannot Be Empty');
                      }
                    },
                    controller: controller,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: onremove,
                      ),
                      hintStyle: const TextStyle(fontSize: 14),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter user name or paste profile URL'.tr,
                      prefixIcon: const Icon(Icons.link),
                      contentPadding: const EdgeInsets.all(8),
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
