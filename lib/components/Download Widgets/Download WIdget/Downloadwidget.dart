


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DownloadLocation extends StatelessWidget {
final  VoidCallback ontap;
  const DownloadLocation({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Download location'.tr,
        style: GoogleFonts.aBeeZee(
          textStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.039,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      subtitle: Text(
        '/storage/emulated/0/VideoDownloader/Download'.tr,
        style: GoogleFonts.aBeeZee(
          textStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w600,
            color: Colors.black38,
          ),
        ),
      ),
      trailing: InkWell(
        onTap: ontap,
        child: Icon(
          Icons.settings,
          color: HexColor('#A660DB'),
        ),
      ),
    );
  }
}
