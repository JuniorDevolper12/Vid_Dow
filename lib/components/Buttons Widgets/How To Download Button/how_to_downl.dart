import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/App Utils/App Colors/Appcolors.dart';

class HowToDownloadButton extends StatelessWidget {
  final VoidCallback onTap;

  const HowToDownloadButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.42),
      child: SizedBox(
        width: Get.width * 0.9,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: HexColor('cdc9f1'), blurRadius: 5)],
              borderRadius: BorderRadius.circular(15),
              color: appColor,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: Get.width * 0.04),
                        child: Text(
                          'How to Download'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.65),
                  child: SizedBox(
                      height: Get.height * 0.04,
                      width: Get.width * 0.3,
                      child: Image.asset('images/how.png')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
