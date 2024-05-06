import 'package:advertising_id/advertising_id.dart';
import 'package:android_play_install_referrer/android_play_install_referrer.dart';
import 'package:device_region/device_region.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:webview/app/screens/home/home.dart';

class HomeController extends GetxController {
  final GlobalKey webViewKey = GlobalKey();
  final state = HomeState();

  @override
  void onInit() async {
    super.onInit();
    state.isLoading.value = true;
    await getAdvertisingId();
    await getInstallReferrer();
    await getSimCountryCode();
    await getAnalyticsId();
    await getTokenAndSubscribe();
    state.isLoading.value = false;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    state.isLoading.value = false;
  }

  InAppWebViewController? webViewController;

  Future<String?> getAdvertisingId() async {
    try {
      state.advertisingId.value = (await AdvertisingId.id(true))!;
      state.isLimitTrackingEnabled.value = (await AdvertisingId.isLimitAdTrackingEnabled)!;
      state.isLimitTrackingEnabled.value;
      return state.advertisingId.value;
    } on PlatformException {
      state.advertisingId.value = 'Failed to get advertising ID';
      state.isLimitTrackingEnabled.value = false;
      return null;
    }
  }

  Future<String?> getInstallReferrer() async {
    try {

      ReferrerDetails referrerDetails = await AndroidPlayInstallReferrer.installReferrer;

      return state.installReferrer.value = referrerDetails.installReferrer ?? 'Failed to get InstallReferrer';
    } catch (e) {
      return state.installReferrer.value = 'Failed to get InstallReferrer';
    }
  }

  Future<String?> getSimCountryCode() async {
    try {
      return state.simCountryCode.value = (await DeviceRegion.getSIMCountryCode())!;
    } catch (e) {
      return state.simCountryCode.value = 'Failed to get SIM CountryCode';
    }
  }

  Future<String?> getAnalyticsId() async {
    try {
      var firebaseApp = Firebase.app();
      var analyticsInstance = FirebaseAnalytics.instanceFor(app: firebaseApp);
      return state.firebaseAnalyticsID.value = (await analyticsInstance.appInstanceId)!;
    } catch (e) {
      return state.firebaseAnalyticsID.value = 'Failed to get Analytics ID';
    }
  }

  Future<String?> getTokenAndSubscribe() async {
    try {
      if (!state.isSubscribed.value) {
        await FirebaseMessaging.instance.subscribeToTopic('news');
        state.isSubscribed.value = true;
      }

      update();
      return state.messagingToken.value = (await FirebaseMessaging.instance.getToken())!;
    } catch (e) {
      return state.messagingToken.value = 'Failed to get Messaging Token';
    }
  }

  InAppWebViewSettings settings = InAppWebViewSettings(
    javaScriptEnabled: true,
    supportZoom: true,
    transparentBackground: true,
    javaScriptCanOpenWindowsAutomatically: true,
    safeBrowsingEnabled: false,
    allowFileAccess: true,
    allowFileAccessFromFileURLs: true,
    sharedCookiesEnabled: true,
    thirdPartyCookiesEnabled: true,
    allowContentAccess: true,
    preferredContentMode: UserPreferredContentMode.MOBILE,
    allowsLinkPreview: true,
    mediaPlaybackRequiresUserGesture: true,
    allowsPictureInPictureMediaPlayback: true,
    domStorageEnabled: true,
    allowsInlineMediaPlayback: true,
    allowsAirPlayForMediaPlayback: true,
    databaseEnabled: true,
    supportMultipleWindows: true,
  );
}
