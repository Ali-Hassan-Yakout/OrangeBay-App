class TicketsResponse {
  TicketsResponse({
    num? id,
    String? name,
    String? categoryName,
    num? price,
    num? tax,
    num? currency,
    List<Days>? days,
  }) {
    _id = id;
    _name = name;
    _categoryName = categoryName;
    _price = price;
    _tax = tax;
    _currency = currency;
    _days = days;
  }

  TicketsResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _categoryName = json['categoryName'];
    _price = json['price'];
    _tax = json['tax'];
    _currency = json['currency'];
    if (json['days'] != null) {
      _days = [];
      json['days'].forEach((v) {
        _days?.add(Days.fromJson(v));
      });
    }
  }

  num? _id;
  String? _name;
  String? _categoryName;
  num? _price;
  num? _tax;
  num? _currency;
  List<Days>? _days;

  num get id => _id ?? -1;

  String get name => _name ?? "";

  String get categoryName => _categoryName ?? "";

  num get price => _price ?? -1;

  num get tax => _tax ?? -1;

  num get currency => _currency ?? -1;

  List<Days> get days => _days ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['categoryName'] = _categoryName;
    map['price'] = _price;
    map['tax'] = _tax;
    map['currency'] = _currency;
    if (_days != null) {
      map['days'] = _days?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Days {
  Days({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Days.fromJson(dynamic json) {
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
