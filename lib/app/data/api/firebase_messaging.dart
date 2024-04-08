import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingService {
  Future<void> initFirebaseMessaging() async {
    var messaging = FirebaseMessaging.instance;

    var settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    debugPrint('${settings.authorizationStatus}');
  }
}
