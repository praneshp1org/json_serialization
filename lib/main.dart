import 'package:flutter/material.dart';
import 'package:json_serialization/pages/YTJSON02.dart';
import 'package:json_serialization/pages/home_page.dart';
import 'package:json_serialization/pages/home_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: YTJSON02(),
    );
  }
}
