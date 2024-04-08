import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/app/screens/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      global: true,
      builder: (hc) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              'Webview App',
              style: Get.textTheme.bodyMedium?.copyWith(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GAID:',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                  ),
                ),
                Text(
                  hc.state.advertisingId.value,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Install Referrer:',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                  ),
                ),
                Text(
                  hc.state.installReferrer.value,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'SIM Country Code:',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                  ),
                ),
                Text(
                  hc.state.simCountryCode.value.toUpperCase(),
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Analytics ID:',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                  ),
                ),
                Text(
                  hc.state.firebaseAnalyticsID.value,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
