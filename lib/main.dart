import 'dart:async';
import 'package:flutter/material.dart';
import './SnapchatHome.dart';


Future main() async => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnapChat clone',
      home: new Snapchat(),
    );
  }
}



