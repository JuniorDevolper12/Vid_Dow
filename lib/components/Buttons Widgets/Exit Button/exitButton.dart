import'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
final String title;
final VoidCallback onTap;
final Color btnColor;

  const ExitButton({super.key, required this.title, required this.onTap, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
          width: size.width * 0.4,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
             title,
              style: const TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
  }
}