class NationalitiesResponse {
  NationalitiesResponse({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  NationalitiesResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  num? _id;
  String? _name;

  num get id => _id ?? -1;

  String get name => _name ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
