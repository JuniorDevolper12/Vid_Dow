import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/App Utils/App Colors/Appcolors.dart';

class DirectLinkDownloader extends StatelessWidget {
  // final String image;
  // final String label;
  final VoidCallback onTap;
  final TextEditingController? controller;

  const DirectLinkDownloader({
    super.key,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            //padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              // color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter user name or paste profile URL'.tr,
                  prefixIcon: const Icon(Icons.link),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(8.0)),
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          padding: const EdgeInsets.all(20.0),
          width: size.width * 1.0,
          height: size.height * 0.25,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Text('AD'.tr),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: size.width * 1.0,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: appColor,
              // primary: Colors.purple,
              // padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'Search'.tr,
              style: const TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
