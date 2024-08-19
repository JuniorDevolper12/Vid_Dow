import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/Langauge Wigdets/language_button.dart';
import '../../utils/App Helpers/Langauge Helper/Langauge Manager/LanguageHelper.dart';
import '../../utils/App Helpers/Langauge Helper/Show Langauge Screen Once/ShowLangaueScreenOnce.dart';
import '../../utils/App Helpers/Navbarhelper/GowithNavbar.dart';
import '../../utils/App Utils/App Colors/Appcolors.dart';
import '../Dashboard Screen/dashboard_screen.dart';
import '../Settings Screen/SettingsScreen.dart';

class LanguageSelection extends StatefulWidget {
  final bool Issetttingpage;

  const LanguageSelection({super.key, required this.Issetttingpage});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  String selectedLanguageCode = ''; // Variable to track selected language code

  void _handleLanguageTap(String languageCode) {
    setState(() {
      selectedLanguageCode = languageCode; // Update the selected language code
      setLanguage(context, languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (widget.Issetttingpage) {
          Navhelper.GoWithoutNavbar(context, SettingScreen());
        } else {}
      },
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          title: Text(
            'Select Your Language'.tr,
            style: const TextStyle(fontSize: 16, fontFamily: 'OpenSauceOne'),
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () async {
                  await storeBoolToSharedPreferences().then((value) {
                    if (widget.Issetttingpage) {
                      Get.to(SettingScreen(
                        sellang: selectedLanguageCode,
                      ));
                    } else {
                      Navhelper.GoWithNavbar(context, const DashboardScreen());
                    }
                  });
                },
                child: Text(
                  'Continue'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: appColor, // Set the text color to white
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          // Enables scrolling
          child: Column(
            children: [
              LanguageButton(
                  languageCode: 'en',
                  languageText: 'English',
                  flagAssetPath: 'images/england.png',
                  isSelected: selectedLanguageCode == 'english',
                  onTap: () {
                    _handleLanguageTap('english');
                  }),
              LanguageButton(
                  languageCode: 'urdu',
                  languageText: 'Urdu',
                  flagAssetPath: 'images/pak.png',
                  isSelected: selectedLanguageCode == 'urdu',
                  onTap: () {
                    _handleLanguageTap('urdu');
                  }),
              LanguageButton(
                  languageCode: 'afrikan',
                  languageText: 'Afrikaans',
                  flagAssetPath: 'images/africa.png',
                  isSelected: selectedLanguageCode == 'afrikan',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('afrikan');
                  }),
              LanguageButton(
                  languageCode: 'arabic',
                  languageText: 'Arabic',
                  flagAssetPath: 'images/saudi.png',
                  isSelected: selectedLanguageCode == 'arabic',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('arabic');
                  }),
              LanguageButton(
                  languageCode: 'ban',
                  languageText: 'Bengali',
                  flagAssetPath: 'images/ban.png',
                  isSelected: selectedLanguageCode == 'bengali',
                  onTap: () {
                    _handleLanguageTap('bengali');
                  }),
              LanguageButton(
                  languageCode: 'neth',
                  languageText: 'Dutch Netherlands',
                  flagAssetPath: 'images/neth.png',
                  isSelected: selectedLanguageCode == 'dutch',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('dutch');
                  }),
              LanguageButton(
                  languageCode: 'french',
                  languageText: 'French',
                  flagAssetPath: 'images/french.png',
                  isSelected: selectedLanguageCode == 'french',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('french');
                  }),
              LanguageButton(
                  languageCode: 'fin',
                  languageText: 'Finnish',
                  flagAssetPath: 'images/finich.png',
                  isSelected: selectedLanguageCode == 'finnish',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('finnish');
                  }),
              LanguageButton(
                  languageCode: 'ger',
                  languageText: 'German',
                  flagAssetPath: 'images/german.png',
                  isSelected: selectedLanguageCode == 'german',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('german');
                  }),
              LanguageButton(
                  languageCode: 'hin',
                  languageText: 'Hindi',
                  flagAssetPath: 'images/india.png',
                  isSelected: selectedLanguageCode == 'hindi',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('hindi');
                  }),
              LanguageButton(
                  languageCode: 'indon',
                  languageText: 'Indonesian',
                  flagAssetPath: 'images/indo.png',
                  isSelected: selectedLanguageCode == 'indo',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('indo');
                  }),
              LanguageButton(
                  languageCode: 'ita',
                  languageText: 'Italian',
                  flagAssetPath: 'images/italian.png',
                  isSelected: selectedLanguageCode == 'italian',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('italian');
                  }),
              LanguageButton(
                  languageCode: 'jap',
                  languageText: 'Japanese',
                  flagAssetPath: 'images/japan.png',
                  isSelected: selectedLanguageCode == 'japenes',
                  onTap: () {
                    // Define what happens when you tap the button
                    _handleLanguageTap('japenes');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
