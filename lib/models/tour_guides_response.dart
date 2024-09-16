class TourGuidesResponse {
  TourGuidesResponse({
    num? id,
    String? name,
    String? phoneNumber,
    String? email,
    num? profitRate,
    String? status,
  }) {
    _id = id;
    _name = name;
    _phoneNumber = phoneNumber;
    _email = email;
    _profitRate = profitRate;
    _status = status;
  }

  TourGuidesResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phoneNumber = json['phoneNumber'];
    _email = json['email'];
    _profitRate = json['profitRate'];
    _status = json['status'];
  }

  num? _id;
  String? _name;
  String? _phoneNumber;
  String? _email;
  num? _profitRate;
  String? _status;

  num get id => _id ?? 0;

  String get name => _name ?? "";

  String get phoneNumber => _phoneNumber ?? "";

  String get email => _email ?? "";

  num get profitRate => _profitRate ?? 0;

  String get status => _status ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phoneNumber'] = _phoneNumber;
    map['email'] = _email;
    map['profitRate'] = _profitRate;
    map['status'] = _status;
    return map;
  }
}
