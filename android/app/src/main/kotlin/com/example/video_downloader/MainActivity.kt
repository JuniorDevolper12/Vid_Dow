package com.example.video_downloader

import LanguageNative
import ListTileNativeAdFactory
import NativeAd2
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class MainActivity: FlutterActivity(){
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine, "NativeAd", ListTileNativeAdFactory(context)
        )
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine, "SmallAd", NativeAd2(context)
        )
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine, "NativeAd3", LanguageNative(context)
        )
    }
    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        super.cleanUpFlutterEngine(flutterEngine)
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "NativeAd3")
        // TODO: Unregister the ListTileNativeAdFactory
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "NativeAd")
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "SmallAd")
    }



}

