import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_serialization/models/random_model.dart';

class PersonService {
  var url, response;
  List data = [];
  List<Person> personList = [];
  Future<List<Person>> getData() async {
    url = Uri.parse("https://randomuser.me/api/");
    response = await http.get(url);
    data = jsonDecode(response.body);

    return personList;
  }
}
