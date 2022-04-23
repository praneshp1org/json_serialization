import 'package:flutter/material.dart';
import 'package:json_serialization/models/u_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CJSON extends StatefulWidget {
  const CJSON({Key? key}) : super(key: key);

  @override
  State<CJSON> createState() => _CJSONState();
}

class _CJSONState extends State<CJSON> {
  var url, response;
  List data = [];
  List<Users1> userList = [];
  bool _isLoading = true;

  Future getData() async {
    url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    response = await http.get(url);
    data = jsonDecode(response.body);
    setState(() {
      userList = data.map((json) => Users1.fromJson(json)).toList();
      _isLoading = false;
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
          title: Text('Complex JSON'),
        ),
        body: (_isLoading == true)
            ? Center(
                child: LinearProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(userList[index].username),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userList[index].email),
                          Text(userList[index].company.name),
                          SizedBox(
                            width: 10,
                          ),
                          Text(userList[index].company.catchPhrase)
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
