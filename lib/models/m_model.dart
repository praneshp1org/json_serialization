class Municipality {
  var title_en, title_ne, type;
  List bbox = [];
  Municipality.fromJson(Map<String, dynamic> json)
      : title_en = json['title_en'],
        type = json['type'],
        bbox = json['bbox'],
        title_ne = json['title_ne'];
}
