import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../../view/Tutorials Screens/How To Download/How_to_download_Screen.dart';
import '../../Buttons Widgets/How To Download Button/how_to_downl.dart';

class No_Downloads_Widget extends StatelessWidget {
  const No_Downloads_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.22),
      child: SizedBox(
        child: Column(
          children: [
            Opacity(
              opacity: 0.2,
              child: Center(
                  child: Text(
                'No History'.tr,
                style: const TextStyle(
                    fontFamily: 'OpenSauceOne', fontWeight: FontWeight.w200),
              )),
            ),
            Center(
              child: HowToDownloadButton(
                onTap: () {
                  Navhelper.GoWithoutNavbar(
                      context, const HowtoDownloadScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
