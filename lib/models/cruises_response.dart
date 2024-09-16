class CruisesResponse {
  CruisesResponse({
    num? id,
    String? name,
    String? status,
  }) {
    _id = id;
    _name = name;
    _status = status;
  }

  CruisesResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
  }

  num? _id;
  String? _name;
  String? _status;

  num get id => _id ?? -1;

  String get name => _name ?? "";

  String get status => _status ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    return map;
  }
}
