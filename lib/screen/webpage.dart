  import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/global.dart';

class webPage extends StatefulWidget {
  const webPage({super.key});

  @override
  State<webPage> createState() => _webPageState();
}

class _webPageState extends State<webPage> {

  InAppWebViewController? inAppWebViewController;
  late PullToRefreshController pullToRefreshController;
  String pageurl = '${Global.weburl}';

  List allBookmarks = [];
  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(color: Colors.red),
        onRefresh: () async {
          if (Platform.isAndroid) {
            await inAppWebViewController!.reload();
          } else if (Platform.isIOS) {
            await inAppWebViewController!.loadUrl(
                urlRequest: URLRequest(
                  url: await inAppWebViewController!.getUrl(),
                ));
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google"),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined)),
        ],
      ),
      // body: ,
    );
  }
}
