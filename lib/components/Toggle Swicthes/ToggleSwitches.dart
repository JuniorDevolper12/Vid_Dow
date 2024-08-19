import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';
import '../Custom Text Widgets/Subtitle Text/SubtitleTextWIdget.dart';

class ToggleSwitchWidget extends StatefulWidget {
  bool status;
  final titletext;
  final subtitletext;
  final Function(bool) onToggle;

  ToggleSwitchWidget({
    super.key,
    required this.status,
    required this.titletext,
    required this.subtitletext,
    required this.onToggle,
  });

  @override
  State<ToggleSwitchWidget> createState() => _ToggleSwitchWidgetState();
}

class _ToggleSwitchWidgetState extends State<ToggleSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: CustomText(text: widget.titletext),
      subtitle: SubtitleTextWidget(subtitle: widget.subtitletext),
      trailing: SizedBox(
        width: Get.width * 0.29,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            FlutterSwitch(
                inactiveToggleColor: Colors.grey.shade400,
                inactiveColor: HexColor('#E6E7E8'),
                toggleColor: HexColor('#A660DB'),
                activeColor: HexColor('#F2E7FA'),
                width: MediaQuery.of(context).size.width / 11,
                height: MediaQuery.of(context).size.height * 0.023,
                toggleSize: 20.0,
                borderRadius: 20,
                value: widget.status,
                onToggle: (val) {
                  // if (val == true) {
                  //   Fluttertoast.showToast(
                  //       msg: 'on'.tr,
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       textColor: Colors.white,
                  //       backgroundColor: Colors.black);
                  // } else {
                  //   Fluttertoast.showToast(
                  //       msg: 'off'.tr,
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       textColor: Colors.white,
                  //       backgroundColor: Colors.black);
                  // }
                  widget.onToggle(val);
                  setState(() {
                    widget.status = val;
                  });
                })
          ],
        ),
      ),
    );
  }
}
