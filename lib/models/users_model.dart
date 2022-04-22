class User {
  var name, email, username;
  Address address;
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        username = json['username'],
        address = Address.fromJson(json['address']);
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
