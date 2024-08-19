import 'dart:async';

import 'package:flutter/foundation.dart';

class Showbutton extends ChangeNotifier {
  bool _canshow = false;
  double _progress = 0.0;

  bool get canshow => _canshow;

  double get progress => _progress;

  void StartTimer() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_progress >= 1.0) {
        timer.cancel();
        _canshow = true;
        _progress = 0.0;
        notifyListeners();
        // Reset progress
      } else {
        _progress += 0.02; // Increment progress
        notifyListeners();
      }
    });

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_progress >= 1.0) {
        timer.cancel();
        _canshow = true;
        _progress = 0.0;
        notifyListeners();
        // Reset progress
      } else {
        _progress += 0.02; // Increment progress
        notifyListeners();
      }
    });
  }
}
