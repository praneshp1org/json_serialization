class Users1 {
  var username, email;
  Company company;
  Users1.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        company = Company.fromJson(json['company']);
}

class Company {
  var name, catchPhrase;
  Company.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        catchPhrase = json['catchPhrase'];
}
