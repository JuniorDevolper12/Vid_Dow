import 'package:flutter/material.dart';

import '../../Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';

class TextButtonsWidget extends StatelessWidget {
  final VoidCallback ontap;
  final String ButtonText;

  const TextButtonsWidget(
      {super.key, required this.ButtonText, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(title: CustomText(text: ButtonText)),
    );
  }
}
