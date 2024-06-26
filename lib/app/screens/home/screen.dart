import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/app/global/global.dart';
import 'package:webview/app/screens/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (hc) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            alignment: Alignment.centerLeft,
            child: hc.state.isLoading.value
                ? const CustomLoader()
                : Stack(
                    children: [
                      Positioned(
                        top: 60,
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FCM Token => ${hc.state.messagingToken.value}',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Firebase Analytics ID => ${hc.state.firebaseAnalyticsID.value}',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                              ),
                            ),

                            Text(
                              'SIM Card => ${hc.state.simCountryCode.value}',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Install Referrer => ${hc.state.installReferrer.value}',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Advertising ID => ${hc.state.advertisingId.value}',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                              ),
                            ),

                            // Text(
                            //   'WebView:',
                            //   style: Get.textTheme.bodyMedium?.copyWith(
                            //     fontSize: 11,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ],
                        ),
                      ),

                      // This is webview with loader
                      // Positioned(
                      //   top: 240,
                      //   left: 10,
                      //   right: 10,
                      //   child: hc.state.progress < 1.0
                      //       ? LinearProgressIndicator(
                      //           backgroundColor: Colors.grey,
                      //           valueColor: const AlwaysStoppedAnimation(Colors.deepPurple),
                      //           value: hc.state.progress.value,
                      //           minHeight: 6,
                      //         )
                      //       : Container(),
                      // ),
                      // Positioned(
                      //   bottom: -5,
                      //   left: 10,
                      //   right: 10,
                      //   child: SizedBox(
                      //     height: MediaQuery.of(context).size.height / 1.7,
                      //     child: InAppWebView(
                      //       initialUrlRequest: URLRequest(
                      //         url: WebUri(hc.state.url),
                      //       ),
                      //       onProgressChanged: (controller, progress) async {
                      //         hc.state.progress.value = progress / 100;
                      //         hc.update();
                      //       },
                      //       onWebViewCreated: (controller) {
                      //         hc.webViewController = controller;
                      //       },
                      //       initialSettings: hc.settings,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
