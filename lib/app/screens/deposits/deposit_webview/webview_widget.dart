import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ovolutter/app/components/snack_bar/show_custom_snackbar.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/url_container.dart';

class MyWebViewWidget extends StatefulWidget {
  const MyWebViewWidget({super.key, required this.url});

  final String url;

  @override
  State<MyWebViewWidget> createState() => _MyWebViewWidgetState();
}

class _MyWebViewWidgetState extends State<MyWebViewWidget> {
  @override
  void initState() {
    url = widget.url;
    super.initState();

    pullToRefreshController = kIsWeb || ![TargetPlatform.iOS, TargetPlatform.android].contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  PullToRefreshController? pullToRefreshController;
  String url = '';
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllow: "camera; microphone",
    iframeAllowFullscreen: true,
  );
  double progress = 0;
  bool isKycPending = false;

  bool isLoading = true;

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    if (Platform.isAndroid) {
      InAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
    return Stack(
      children: [
        isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox(),
        InAppWebView(
          pullToRefreshController: pullToRefreshController,
          key: webViewKey,
          initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          initialSettings: settings,
          onLoadStart: (controller, url) {
            printX('payment url: ${url.toString()}');
            if (url.toString() == '${UrlContainer.domainUrl}/user/deposit/history') {
              Get.offAndToNamed(RouteHelper.depositsHistoryScreen);
              CustomSnackBar.success(successList: [MyStrings.requestSuccess.tr]);
            } else if (url.toString() == '${UrlContainer.domainUrl}/user/deposit') {
              Navigator.pop(context);
              CustomSnackBar.error(errorList: [MyStrings.requestFail.tr]);
            }

            setState(() {
              this.url = url.toString();
            });
          },
          onPermissionRequest: (controller, resources) async {
            return PermissionResponse(resources: resources.resources, action: PermissionResponseAction.GRANT);
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var uri = navigationAction.request.url!;

            if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(
                  Uri.parse(url),
                );
                return NavigationActionPolicy.CANCEL;
              }
            }

            return NavigationActionPolicy.ALLOW;
          },
          onLoadStop: (controller, url) async {
            pullToRefreshController?.endRefreshing();
            setState(() {
              isLoading = false;
              this.url = url.toString();
            });
          },
          onReceivedError: (controller, resourceRequest, resourceError) {
            pullToRefreshController?.endRefreshing();
          },
          onProgressChanged: (controller, progress) {
            if (progress == 100) {
              pullToRefreshController?.endRefreshing();
            }
            setState(() {
              this.progress = progress / 100;
            });
          },
          onUpdateVisitedHistory: (controller, url, androidIsReload) {
            setState(() {
              this.url = url.toString();
            });
          },
          onConsoleMessage: (controller, consoleMessage) {
            if (kDebugMode) {
              printX(consoleMessage);
            }
          },
        )
      ],
    );
  }
}
