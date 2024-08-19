import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Snackbar/ShowSnackbar.dart';

class Clipboardhelper extends ChangeNotifier {
  final TextEditingController _Searchcontroller = TextEditingController();

  TextEditingController get SearchController => _Searchcontroller;
  String _newtext = '';

  String get Newtext => _newtext;

  void Pastefromclipboard() {
    FlutterClipboard.paste().then((value) {
      if (value.isNotEmpty) {
        _Searchcontroller.text = value;
        notifyListeners();
        _newtext = value;
        Snackbarhelper.Showsnackbar('Clipboard', 'Text Pasted From Clipboard');
      }
    });
  }

  void onchanged(String value) {
    _Searchcontroller.text = value;
    notifyListeners();
  }

  void emptytext() {
    if (_Searchcontroller.text.isNotEmpty) {
      _Searchcontroller.text = '';
      notifyListeners();
    }
  }
}
