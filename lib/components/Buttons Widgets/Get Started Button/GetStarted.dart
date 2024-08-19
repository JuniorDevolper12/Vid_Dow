import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Provider/ShowButton/ShowButton.dart';
import '../../../utils/App Utils/App Colors/Appcolors.dart';
import '../../Progress Widget/ButtonProgress/ButtonProgress.dart';

class Custombutton extends StatelessWidget {
  final String buttontitle;
  final VoidCallback ontap;

  const Custombutton(
      {super.key, required this.buttontitle, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Showbutton>(context);
    return InkWell(
      onTap: ontap,
      child: Container(
          height: Get.height * 0.055,
          width: value.canshow ? Get.width * .778 : Get.width * .48,
          decoration: value.canshow
              ? const BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )
              : null,
          child: value.canshow
              ? Center(
                  child: Text(
                    buttontitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSauceOne',
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                )
              : const ProgressBar()),
    );
  }
}
