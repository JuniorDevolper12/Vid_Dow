import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsapppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String mainText;
  final Color bgcolor;
  final Color textcolor;
  final String logoImg;
  final bordercolor;

  const WhatsapppButton(
      {super.key,
      this.onTap,
      required this.mainText,
      required this.logoImg,
      required this.bgcolor,
      required this.textcolor,
      required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: Get.width * 0.35,
          height: Get.height * 0.05,
          decoration: BoxDecoration(
              border: Border.all(color: bordercolor, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: bgcolor // Color(0xffFFF0D9),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logoImg,
                width: Get.width * 0.07,
              ),
              Center(
                child: Text(
                  mainText,
                  style: TextStyle(
                      color: textcolor,
                      fontSize: 8,
                      fontFamily: 'OpenSauceOne',
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
