import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:webview/app/data/api/api.dart';
import 'package:webview/app/screens/home/screen.dart';
import 'package:webview/firebase_options.dart';

Future<void> initAppInitials() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessagingService().initFirebaseMessaging();
  await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
}

Future<void> main() async {
  await initAppInitials();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webview App',
      home: HomeScreen(),
    );
  }
}
