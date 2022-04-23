import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:json_serialization/models/comment.dart';

class YTJSON02 extends StatefulWidget {
  const YTJSON02({Key? key}) : super(key: key);

  @override
  State<YTJSON02> createState() => _YTJSON02State();
}

class _YTJSON02State extends State<YTJSON02> {
  //fields
  var url, response;
  List data = [];
  List<Comment1> comment1 = []; //
  bool _isLoading = true;

  //future
  Future getComments() async {
    url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    response = await http.get(url);
    data = convert.jsonDecode(response.body);
    setState(() {
      comment1 = data.map((json) => Comment1.fromJson(json)).toList();
      //data is fetched
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('JSON Serialization 02')),
        body: (_isLoading == true)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: comment1.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(comment1[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(comment1[index].email),
                          Text(comment1[index].body),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
