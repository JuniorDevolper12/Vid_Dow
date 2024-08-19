import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QualityRadioTile extends StatelessWidget {
  final String title;
  final String value;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;
  final bool isenabled;

  const QualityRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.isenabled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.5,
      height: Get.height * 0.04,
      child: RadioListTile<String>(
          toggleable: isenabled,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: groupValue!.contains(value) ? 'OpenSauceOne' : ' ',
            ),
          ),
          value: value,
          groupValue: groupValue,
          onChanged: isenabled ? onChanged : null),
    );
  }
}
