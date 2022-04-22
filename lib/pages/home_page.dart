import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:json_serialization/models/comments_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url, response;
  List data = [];
  List<Comment> comment = [];
  bool isLoading = true;

  Future getData() async {
    url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    response = await http.get(url);
    data = convert.jsonDecode(response.body);
    setState(() {
      comment = data.map((json) => Comment.fromJson(json)).toList();
      isLoading = false;
    });
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
          title: Text('JSON serialization'),
        ),
        body: (isLoading == true)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: comment.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(comment[index].name),
                      trailing: Text("$index"),
                      subtitle: Row(
                        children: [
                          Text(comment[index].email),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
