import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  Future<void> initFirebaseMessaging() async {
    var messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();
  }
}
