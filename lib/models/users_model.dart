class User {
  var name, email, username;
}

class Address {
  var city;
  Geo geo;
  Address.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        geo = Geo.fromJson(json['geo']);
}

class Geo {
  var lat, lng;
  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}
