import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_downloader/utils/Ad%20Manager/Ad%20Helper/Adhelper.dart';
import 'package:video_downloader/view/Dashboard%20Screen/dashboard_screen.dart';

import '../../components/Buttons Widgets/Exit Button/exitButton.dart';
import '../../utils/App Utils/App Colors/Appcolors.dart';

class ExitScreen extends StatefulWidget {
  const ExitScreen({super.key});

  @override
  State<ExitScreen> createState() => _ExitScreenState();
}

class _ExitScreenState extends State<ExitScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.2,
                    right: size.width * 0.2,
                    top: size.width * 0.5), // Responsive padding
                child: Image(
                  image: const AssetImage(
                    'images/exit.png',
                  ),
                  width: size.width * 0.5, // Responsive image size
                  height: size.height * 0.3, // Responsive image size
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 130,
                  child: Text(
                    'Are you sure want'.tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  width: 130,
                  child: Text(
                    'to exit?'.tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExitButton(
                        title: 'No'.tr,
                        onTap: () {
                          Get.back();
                          AdUtils.handleAdAndNavigation(
                            context,
                            (p0) {
                              Get.offAll(const DashboardScreen());
                            },
                          );
                        },
                        btnColor: appColor),
                    const SizedBox(
                      width: 10,
                    ),
                    ExitButton(
                        title: 'Yes'.tr,
                        onTap: () {
                          SystemNavigator.pop();
                        },
                        btnColor: Colors.red),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
