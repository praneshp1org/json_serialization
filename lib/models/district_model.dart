class District {
  var title_en, title_ne;
  List bbox = [];
  late Centroid centroid;
  District.fromJson(Map<String, dynamic> json)
      : title_en = json['title_en'],
        title_ne = json['title_ne'],
        bbox = json['bbox'],
        centroid = Centroid.fromJson(json['centroid']);
}

class Centroid {
  List coordinates = [];
  Centroid.fromJson(Map<String, dynamic> json)
      : coordinates = json['coordinates'];
}
