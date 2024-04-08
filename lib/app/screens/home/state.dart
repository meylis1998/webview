import 'package:get/get.dart';

class HomeState {
  RxString advertisingId = ''.obs;
  RxBool isLimitTrackingEnabled = false.obs;

  RxString installReferrer = ''.obs;

  RxString simCountryCode = ''.obs;

  RxString firebaseAnalyticsID = ''.obs;
}
