import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:webview/app/global/global.dart';
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
            alignment: Alignment.centerLeft,
            child: hc.state.isLoading.value
                ? const CustomLoader()
                : Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GAID:',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              hc.state.advertisingId.value,
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'Install Referrer:',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              hc.state.installReferrer.value,
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'SIM Country Code:',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              hc.state.simCountryCode.value.toUpperCase(),
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'Analytics ID:',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              hc.state.firebaseAnalyticsID.value,
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'Messaging Token:',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              hc.state.messagingToken.value,
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'WebView:',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 10,
                        right: 10,
                        child: hc.state.progress < 1.0
                            ? LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                valueColor: const AlwaysStoppedAnimation(Colors.deepPurple),
                                value: hc.state.progress.value,
                                minHeight: 6,
                              )
                            : Container(),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 1.7,
                          child: InAppWebView(
                            initialUrlRequest: URLRequest(
                              url: WebUri(hc.state.url),
                              method: 'GET',
                            ),
                            onProgressChanged: (controller, progress) async {
                              hc.state.progress.value = progress / 100;
                              hc.update();
                            },
                            initialSettings: hc.settings,
                          ),
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
