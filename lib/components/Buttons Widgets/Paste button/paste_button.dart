import 'package:flutter/material.dart';

import '../../../utils/App Utils/App Colors/Appcolors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool light;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.light});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.45,
      child: GestureDetector(
        onTap: onTap,
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
            title,
            style: TextStyle(
                fontSize: 15,
                color: light ? Colors.grey : Colors.white,
                fontFamily: 'OpenSauceOne',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
