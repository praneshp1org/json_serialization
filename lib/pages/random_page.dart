import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_serialization/models/random_model.dart';

class RPage extends StatefulWidget {
  const RPage({Key? key}) : super(key: key);

  @override
  State<RPage> createState() => _RPageState();
}

class _RPageState extends State<RPage> {
  var url, response;
  List data = [];
  List<Person> personList = [];
  Future getData() async {
    url = Uri.parse("https://randomuser.me/api/");
    response = await http.get(url);
    data = jsonDecode(response.body);
    setState(() {
      personList = data.map((json) => Person.fromJson(json)).toList();
    });

    //return personList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
      ),
      body: ListView.builder(
        itemCount: personList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(personList[index].phoneNumber),
            ),
          );
        },
      ),
    );
  }
}
