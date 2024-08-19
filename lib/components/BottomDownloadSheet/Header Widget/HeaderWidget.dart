import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String HeaderImage;
  const HeaderWidget(
      {super.key, required this.HeaderImage, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: Get.width * 0.015,
              top: Get.height * 0.02,
              left: Get.width * .02),
          child: Image.asset(HeaderImage),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: Get.height * 0.025, left: Get.width * 0.004),
          child: Text(
            title.tr,
            style: TextStyle(
                fontSize: Get.height * 0.018,
                fontFamily: 'OpenSauceOne',
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.clip),
          ),
        )
      ],
    );
  }
}
