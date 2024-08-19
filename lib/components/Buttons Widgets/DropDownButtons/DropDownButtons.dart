import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Provider/WebView Provider/WebviewProvider.dart';

class DropDownButtons extends StatefulWidget {
  const DropDownButtons({
    super.key,
  });

  @override
  State<DropDownButtons> createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewProvider>(builder: (context, value, child) {
      value.getengine();
      return DropdownButton(
        underline: const Text(''),
        alignment: AlignmentDirectional.center,
        style: const TextStyle(
            fontSize: 12, color: Colors.black, fontFamily: 'OpenSauceOne'),
        items: [
          DropdownMenuItem(
              value: 'google',
              child: Row(
                children: [
                  Image.asset(
                    'images/google.png',
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Google".tr),
                  )
                ],
              )),
          DropdownMenuItem(
              value: 'bing',
              child: Row(
                children: [
                  Image.asset(
                    'images/bing.png',
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Bing".tr),
                  )
                ],
              )),
          DropdownMenuItem(
              value: 'yahoo',
              child: Row(
                children: [
                  Image.asset(
                    'images/yahoo.png',
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Yahoo".tr),
                  )
                ],
              )),
        ],
        onChanged: (v) async {
          await value.ChangeSearchEngine(v!);
          value.getengine();
          setState(() {});
        },
      );
    });
  }
}
