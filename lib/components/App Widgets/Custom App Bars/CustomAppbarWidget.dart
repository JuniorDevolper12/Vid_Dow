import 'package:flutter/material.dart';
import 'package:video_downloader/utils/Methods/Navigation%20Methods/NavigationMethods.dart';
import 'package:video_downloader/view/Dashboard%20Screen/dashboard_screen.dart';

class CustomAppBarWigdet extends StatelessWidget {
  final title;

  const CustomAppBarWigdet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              ChangeScreen().OffAll(DashboardScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 2, right: 10),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontFamily: 'OpenSauceOne'),
          ),
        )
      ],
    );
  }
}
