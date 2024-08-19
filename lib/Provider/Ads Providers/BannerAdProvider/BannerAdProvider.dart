import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Banneradprovider extends ChangeNotifier {
  BannerAd? _bannerAd;
  BannerAd? _bannerAd2;
  BannerAd? _bannerAd3;

  BannerAd? get bannerAd => _bannerAd;

  BannerAd? get bannerAd2 => _bannerAd2;

  BannerAd? get bannerAd3 => _bannerAd3;
  bool _isloaded = false;
  bool _isloaded2 = false;
  bool _isloaded3 = false;

  bool get isloaded => _isloaded;

  bool get isloaded2 => _isloaded2;

  bool get isloaded3 => _isloaded3;

  loadbannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/9214589741',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            _isloaded = true;
            notifyListeners();
          },
          onAdFailedToLoad: (ad, error) {
            loadbannerAd();
            _isloaded = false;
            notifyListeners();
            log(error.toString());
          },
          onAdClicked: (ad) {},
          onAdClosed: (ad) {},
          onAdWillDismissScreen: (ad) {},
        ),
        request: AdRequest())
      ..load();
  }

  loadbannerAd2() {
    _bannerAd2 = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/9214589741',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            _isloaded2 = true;
            notifyListeners();
          },
          onAdFailedToLoad: (ad, error) {
            loadbannerAd();
            _isloaded2 = false;
            notifyListeners();
            log(error.toString());
          },
          onAdClicked: (ad) {},
          onAdClosed: (ad) {},
          onAdWillDismissScreen: (ad) {},
        ),
        request: AdRequest())
      ..load();
  }

  loadbannerAd3() {
    _bannerAd3 = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/9214589741',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            _isloaded3 = true;
            notifyListeners();
          },
          onAdFailedToLoad: (ad, error) {
            loadbannerAd();
            _isloaded3 = false;
            notifyListeners();
            log(error.toString());
          },
          onAdClicked: (ad) {},
          onAdClosed: (ad) {},
          onAdWillDismissScreen: (ad) {},
        ),
        request: AdRequest())
      ..load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd!.dispose();
    _bannerAd2!.dispose();
    _bannerAd3!.dispose();
  }
}
