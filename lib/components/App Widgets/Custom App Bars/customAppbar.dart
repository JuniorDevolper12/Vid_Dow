import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 30,
      iconTheme: IconThemeData(size: 20),
      title: Text(
        "$title ${'Video Download'.tr}",
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.043,
            fontFamily: 'OpenSauceOne'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
