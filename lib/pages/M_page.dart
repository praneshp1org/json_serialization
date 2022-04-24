import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_serialization/models/m_model.dart';

class MPage extends StatefulWidget {
  const MPage({Key? key}) : super(key: key);

  @override
  State<MPage> createState() => _MPageState();
}

class _MPageState extends State<MPage> {
  var url, response;
  List data = [];
  bool _isLoading = true;
  List<Municipality> municipalityList = [];

  Future<List<Municipality>> fetchData() async {
    url = Uri.parse("https://data.askbhunte.com/api/v1/municipals");
    response = await http.get(url);

    data = jsonDecode(response.body);
    setState(() {
      municipalityList =
          data.map((json) => Municipality.fromJson(json)).toList();
      _isLoading = false;
    });
    return municipalityList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nepal local levels'),
        ),
        body: (_isLoading == true)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        trailing: Icon(Icons.arrow_circle_right_outlined),
                        title: Text(
                            municipalityList[index].title_en.toString() +
                                " (" +
                                municipalityList[index].title_ne.toString() +
                                ")"),
                        subtitle: Text(municipalityList[index].type.toString()),
                      ),
                    );
                  },
                ),
              ));
  }
}
