import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MPage extends StatefulWidget {
  const MPage({Key? key}) : super(key: key);

  @override
  State<MPage> createState() => _MPageState();
}

class _MPageState extends State<MPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nepal local levels'),
      ),
    );
  }
}
