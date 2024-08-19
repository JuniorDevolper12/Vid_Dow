import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SoicalHelpButton extends StatefulWidget {
  final VoidCallback ontap;
  final String imagepath;
  final String title;
  const SoicalHelpButton(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.ontap});

  @override
  State<SoicalHelpButton> createState() => _SoicalHelpButtonState();
}

class _SoicalHelpButtonState extends State<SoicalHelpButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)]),
        height: Get.height * 0.125,
        width: Get.width * .25,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 42,
                image: AssetImage(widget.imagepath),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: Get.width * 0.025, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
