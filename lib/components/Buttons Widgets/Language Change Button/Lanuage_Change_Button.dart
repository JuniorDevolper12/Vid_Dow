import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/App Helpers/Langauge Helper/Get Saved Langauge/Getsavedlanguage.dart';
import '../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../../view/Langauge Screens/LangaugeScreen.dart';
import '../../Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';

class Langaugeoptions extends StatefulWidget {
  const Langaugeoptions({
    super.key,
  });

  @override
  State<Langaugeoptions> createState() => _LangaugeoptionsState();
}

class _LangaugeoptionsState extends State<Langaugeoptions> {
  String? language;

  @override
  void initState() {
    super.initState();
    Langaugegetter.getSavedLanguage().then((value) {
      setState(() {
        language = value;
      });
    });
  }

  String selectedValue = 'Default';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navhelper.GoWithoutNavbar(
            context, const LanguageSelection(Issetttingpage: true));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: Get.width * 0.035,
                ),
                CustomText(text: 'Language Options'.tr),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
