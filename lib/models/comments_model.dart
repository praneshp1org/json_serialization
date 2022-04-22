class Comment {
  var name, email, body;
  Comment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
