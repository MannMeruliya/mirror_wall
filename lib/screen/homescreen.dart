import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/global.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  InAppWebViewController? inAppWebViewController;
  late PullToRefreshController pullToRefreshController;

  List bookmaark = [];

  String pageURL = "${Global.weburl}";

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(onRefresh: () async {
      if (Platform.isAndroid) {
        await inAppWebViewController!.reload();
      } else if (Platform.isIOS) {
        await inAppWebViewController!.loadUrl(
          urlRequest: URLRequest(
            url: await inAppWebViewController!.getUrl(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google"),
        actions: [
        IconButton(onPressed: (){

        }, icon: Icon(Icons.bookmark_border_rounded)),
          IconButton(
            onPressed: () async {
              if (await inAppWebViewController!.canGoBack()) {
                await inAppWebViewController!.goBack();
              }
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          IconButton(
              onPressed: () async {
                await inAppWebViewController!.loadUrl(
                    urlRequest:
                        URLRequest(url: Uri.parse("https://www.google.co.in")));
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () async {
                if (await inAppWebViewController!.canGoForward()) {
                  await inAppWebViewController!.goForward();
                }
              },
              icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("$pageURL")),
        onWebViewCreated: (controller) {
          inAppWebViewController = controller;
        },
        pullToRefreshController: pullToRefreshController,
        onLoadStop: (controller, uri) async {
          await pullToRefreshController.endRefreshing();
        },
      ),
    );
  }
}
