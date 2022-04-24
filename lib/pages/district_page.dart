import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_serialization/models/district_model.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({Key? key}) : super(key: key);

  @override
  State<DistrictPage> createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  var url, response;
  bool _isLoading = true;
  List data = [];
  List<District> districtList = [];

  Future<List<District>> getDistrict() async {
    url = Uri.parse("https://data.askbhunte.com/api/v1/districts");
    response = await http.get(url);
    data = jsonDecode(response.body);
    setState(() {
      districtList = data.map((json) => District.fromJson(json)).toList();
      _isLoading = false;
    });
    return districtList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDistrict();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('JSON Serialization'),
        ),
        body: (_isLoading == true)
            ? Center(
                child: LinearProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: districtList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(districtList[index].title_en +
                            " ( " +
                            districtList[index].title_ne +
                            " )"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("LAT: " +
                                    districtList[index]
                                        .centroid
                                        .coordinates[1]
                                        .toString()),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("LNG: " +
                                    districtList[index]
                                        .centroid
                                        .coordinates[0]
                                        .toString()),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(districtList[index].bbox[1].toString() +
                                    " / " +
                                    districtList[index].bbox[3].toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Text(districtList[index].bbox[0].toString() +
                                    " / " +
                                    districtList[index].bbox[2].toString()),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
