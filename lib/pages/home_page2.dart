import 'package:flutter/material.dart';
import 'package:json_serialization/models/users_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  var url, response;
  List data = [];
  List<User> userList = [];
  bool _isLoading = true;

  Future getUser() async {
    url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    response = await http.get(url);
    data = convert.jsonDecode(response.body);
    setState(() {
      userList = data.map((json) => User.fromJson(json)).toList();
      _isLoading = !_isLoading;
    });
    return userList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Complex JSON Serialization'),
        ),
        body: (_isLoading == true)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(userList[index].name),
                      subtitle: Row(
                        children: [
                          Text("LAT: " + userList[index].address.geo.lat),
                          SizedBox(
                            width: 8,
                          ),
                          Text("LNG: " + userList[index].address.geo.lng),
                          SizedBox(
                            width: 8,
                          ),
                          //Text(userList[index].username),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
