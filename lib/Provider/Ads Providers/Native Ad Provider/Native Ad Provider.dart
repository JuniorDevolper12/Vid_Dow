import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SplashNativeloader extends ChangeNotifier {
  NativeAd? _nativeAd;
  NativeAd? _nativeAd2;
  NativeAd? _nativeAd3;
  NativeAd? get nativeAd => _nativeAd;
  NativeAd? get nativeAd2 => _nativeAd2;
  NativeAd? get nativeAd3 => _nativeAd3;
  bool _isloaded = false;
  bool _isloaded2 = false;
  bool _isloaded3 = false;
  bool get isAdloaded => _isloaded;
  bool get isAdloaded2 => _isloaded2;
  bool get isAdloaded3 => _isloaded3;
  loadallads() async {
    if (_nativeAd != null || _nativeAd2 != null || _nativeAd3 != null) {
      await _nativeAd!.dispose();
      await _nativeAd2!.dispose();
      await _nativeAd3!.dispose();
    }
    loadsplashnative();
    loadsplashnative3();
    loadsplashnative2();
  }

  loadsplashnative() {
    try {
      _nativeAd = NativeAd(
        factoryId: 'SmallAd',
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        nativeAdOptions: NativeAdOptions(
            adChoicesPlacement: AdChoicesPlacement.topRightCorner),
        listener: NativeAdListener(onAdLoaded: (ad) {
          _isloaded = true;
          notifyListeners();
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          log(error.toString());
          _isloaded = false;
          notifyListeners();
          loadsplashnative();
        }),
        request: const AdRequest(),
      )..load();
    } catch (e) {
      print('An error occurred: $e');
      _nativeAd!.dispose();
      loadsplashnative();
    }
  }

  loadsplashnative2() {
    try {
      _nativeAd2 = NativeAd(
        factoryId: 'NativeAd',
        adUnitId: 'ca-app-pub-3940256099942544/1044960115',
        nativeAdOptions: NativeAdOptions(
            adChoicesPlacement: AdChoicesPlacement.topRightCorner),
        listener: NativeAdListener(onAdLoaded: (ad) {
          _isloaded2 = true;
          notifyListeners();
        }, onAdFailedToLoad: (ad, error) {
          _isloaded2 = false;
          ad.dispose();
          log(error.toString());
          notifyListeners();
          loadsplashnative();
        }),
        request: const AdRequest(),
      )..load();
    } catch (e) {
      _isloaded2 = false;
      notifyListeners();
      print('An error occurred: $e');
      _nativeAd2!.dispose();
      loadsplashnative();
    }
  }

  loadsplashnative3() {
    try {
      _nativeAd3 = NativeAd(
        factoryId: 'NativeAd',
        adUnitId: 'ca-app-pub-3940256099942544/1044960115',
        nativeAdOptions: NativeAdOptions(
            adChoicesPlacement: AdChoicesPlacement.topRightCorner),
        listener: NativeAdListener(onAdLoaded: (ad) {
          _isloaded3 = true;
          notifyListeners();
        }, onAdFailedToLoad: (ad, error) {
          _isloaded3 = false;
          notifyListeners();
          ad.dispose();
          log(error.toString());
          notifyListeners();
          loadsplashnative3();
        }),
        request: const AdRequest(),
      )..load();
    } catch (e) {
      print('An error occurred: $e');
      _nativeAd2!.dispose();
      loadsplashnative3();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nativeAd!.dispose();
    _nativeAd2!.dispose();
    _nativeAd3!.dispose();
  }
}
