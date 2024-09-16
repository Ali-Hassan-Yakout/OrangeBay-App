class ProductResponse {
  ProductResponse({
    num? id,
    String? name,
    String? imgUrl,
    num? price,
    num? salesCenterId,
  }) {
    _id = id;
    _name = name;
    _imgUrl = imgUrl;
    _price = price;
    _salesCenterId = salesCenterId;
  }

  ProductResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _imgUrl = json['imgUrl'];
    _price = json['price'];
    _salesCenterId = json['salesCenterId'];
  }

  num? _id;
  String? _name;
  String? _imgUrl;
  num? _price;
  num? _salesCenterId;

  num get id => _id ?? -1;

  String get name => _name ?? "";

  String get imgUrl => _imgUrl ?? "";

  num get price => _price ?? -1;

  num get salesCenterId => _salesCenterId ?? -1;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['imgUrl'] = _imgUrl;
    map['price'] = _price;
    map['salesCenterId'] = _salesCenterId;
    return map;
  }
}
