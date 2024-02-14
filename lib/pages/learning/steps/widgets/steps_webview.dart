// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../configs/styles.dart';

class StepsWebView extends StatefulWidget {
  final String categoryId;

  const StepsWebView({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<StepsWebView> createState() => _StepsWebViewState(categoryId: categoryId);
}

class _StepsWebViewState extends State<StepsWebView> {
  final _storage = const FlutterSecureStorage();

  final String categoryId;

  _StepsWebViewState({required this.categoryId});

  final GlobalKey webViewKey = GlobalKey();

  String _accessToken = '';
  String _refreshToken = '';

  String url = '';
  String title = '';
  double progress = 0;
  bool? isSecure;
  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    _setupSessionStorage();
  }

  Future<void> _setupSessionStorage() async {
    String? accessToken = await _storage.read(key: 'access_token');

    _accessToken = accessToken!;

      String? refreshToken = await _storage.read(key: 'refresh_token');

    _refreshToken = refreshToken!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(children: <Widget>[
        Expanded(
            child: Stack(
              children: [
                InAppWebView(
                  key: Key(categoryId),
                  initialUrlRequest: URLRequest(url: WebUri("https://wordflow.space/learn-category/$categoryId")),
                  initialSettings: InAppWebViewSettings(
                      transparentBackground: true,
                      safeBrowsingEnabled: true,
                      isFraudulentWebsiteWarningEnabled: true),
                  onWebViewCreated: (controller) async {
                    webViewController = controller;
                    if (!kIsWeb &&
                        defaultTargetPlatform == TargetPlatform.android) {
                      await controller.startSafeBrowsing();
                    }
                  },
                  onLoadStart: (controller, url) {
                    if (url != null) {
                      setState(() {
                        this.url = url.toString();
                        isSecure = urlIsSecure(url);
                      });
                    }
                    controller.evaluateJavascript(source: "window.sessionStorage.setItem('token', '$_accessToken')");
                    controller.evaluateJavascript(source: "window.localStorage.setItem('refreshToken', '$_refreshToken')");
                    controller.evaluateJavascript(source: "window.isWebView = true;");
                  },
                  onLoadStop: (controller, url) async {
                    if (url != null) {
                      setState(() {
                        this.url = url.toString();
                      });
                    }

                    final sslCertificate = await controller.getCertificate();
                    setState(() {
                      isSecure = sslCertificate != null ||
                          (url != null && urlIsSecure(url));
                    });
                  },
                  onUpdateVisitedHistory: (controller, url, isReload) {
                    if (url != null) {
                      setState(() {
                        this.url = url.toString();
                      });
                    }
                  },
                  onTitleChanged: (controller, title) {
                    if (title != null) {
                      setState(() {
                        this.title = title;
                      });
                    }
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                  shouldOverrideUrlLoading: (controller, navigationAction) async {
                    final url = navigationAction.request.url;
                    if (navigationAction.isForMainFrame &&
                        url != null &&
                        ![
                          'http',
                          'https',
                          'file',
                          'chrome',
                          'data',
                          'javascript',
                          'about'
                        ].contains(url.scheme)) {
                    }
                    return NavigationActionPolicy.ALLOW;
                  },
                ),
                progress < 1.0
                    ? LinearProgressIndicator(value: progress, color: Styles.colorMain,)
                    : Container(),
              ],
            )),
      ]),
    );
  }

  void handleClick(int item) async {
    switch (item) {
      case 0:
        await InAppBrowser.openWithSystemBrowser(url: WebUri(url));
        break;
      case 1:
        await webViewController?.clearCache();
        if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
          await webViewController?.clearHistory();
        }
        setState(() {});
        break;
    }
  }

  static bool urlIsSecure(Uri url) {
    return (url.scheme == "https") || isLocalizedContent(url);
  }

  static bool isLocalizedContent(Uri url) {
    return (url.scheme == "file" ||
        url.scheme == "chrome" ||
        url.scheme == "data" ||
        url.scheme == "javascript" ||
        url.scheme == "about");
  }
}