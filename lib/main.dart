import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/screen/homescreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid){
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const homescreen(),
    );
  }
}
