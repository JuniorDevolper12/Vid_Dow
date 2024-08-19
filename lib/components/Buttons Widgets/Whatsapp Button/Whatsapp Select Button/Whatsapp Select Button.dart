import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/App Utils/App Colors/Appcolors.dart';
import '../../../Gradient Widget/Button Gradient/ButtonGradient.dart';
import '../Main Button/WhatsappButtons.dart';

Widget SimpleWhatsappButton(bool isbusiness, VoidCallback ontap) {
  return Center(
      child: WhatsapppButton(
    bordercolor: Colors.transparent,
    textcolor: isbusiness ? Colors.black : Colors.white,
    bgcolor: isbusiness ? Colors.transparent : appColor,
    mainText: "Whatsapp Status".tr + "\n" + "Downloader".tr,
    logoImg: 'images/WhatsappIcon2.png',
    onTap: ontap,
  ));
}

Widget WhatsappBusinessButton(bool isbusiness, VoidCallback ontap) {
  return ButtonGradient(
    child: WhatsapppButton(
      bordercolor: Colors.grey,
      textcolor: isbusiness ? Colors.white : Colors.black,
      bgcolor: isbusiness ? appColor : Colors.transparent,
      mainText:
          "Whatsapp Business".tr + "\n" + "Status".tr + " " + "Downloader".tr,
      logoImg: 'images/BusinessIcon.png',
      onTap: ontap,
    ),
  );
}

Widget Whatsapptitle(bool isbusiness) {
  return Text(
    isbusiness
        ? "Whatsapp Business".tr + " " + "Status".tr + " " + "Downloader".tr
        : 'WhatsApp Status Downloader'.tr,
    style: TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: Get.width * 0.035,
      fontFamily: 'OpenSauceOne',
    ),
  );
}
