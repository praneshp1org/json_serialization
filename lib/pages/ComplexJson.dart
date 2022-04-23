import 'package:flutter/material.dart';

class CJSON extends StatefulWidget {
  const CJSON({Key? key}) : super(key: key);

  @override
  State<CJSON> createState() => _CJSONState();
}

class _CJSONState extends State<CJSON> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex JSON'),
      ),
      body: Center(
        child: Text('JSON'),
      ),
    );
  }
}
