import 'package:get/get.dart';

class HomeState {
  RxBool isLoading = false.obs;

  String url = 'https://liverpoolfc.ru/';
  RxDouble progress = 0.0.obs;
  
  RxString advertisingId = ''.obs;
  RxBool isLimitTrackingEnabled = false.obs;

  RxString installReferrer = ''.obs;

  RxString simCountryCode = ''.obs;

  RxString firebaseAnalyticsID = ''.obs;

  RxString messagingToken = ''.obs;
}
