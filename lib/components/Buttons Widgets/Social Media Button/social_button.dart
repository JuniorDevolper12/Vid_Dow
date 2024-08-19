import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;

  const SocialButton(
      {super.key,
      required this.image,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(
              image,
              width: 40.0,
              height: 40.0,
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontFamily: 'OpenSauceOne'),
        ),
      ],
    );
  }
}
