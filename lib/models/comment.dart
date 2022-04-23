//blueprint
class Comment1 {
  var name, email, body;

  //named constructor
  Comment1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
