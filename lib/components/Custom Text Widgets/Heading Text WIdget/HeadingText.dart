import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HeadingText extends StatelessWidget {
 final String Heading;
  const HeadingText({super.key, required this.Heading});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 13),
        child: Text(
          Heading,
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              fontWeight: FontWeight.w600,
              color: HexColor('#A660DB'),
            ),
          ),
        ),
      ),
    );
  }
}
