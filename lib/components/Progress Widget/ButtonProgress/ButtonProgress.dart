import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.04,
          width: Get.width * 0.2,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 7),
            child: Center(
              child: Text(
                'Loading.....',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSauceOne',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.5,
          width: Get.width * 0.33,
          child: const LinearProgressIndicator(),
        ),
      ],
    );
  }
}
