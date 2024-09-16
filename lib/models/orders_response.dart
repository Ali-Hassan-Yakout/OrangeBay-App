class OrdersResponse {
  OrdersResponse({
    num? quantity,
    List<SerialNumbers>? serialNumbers,
  }) {
    _quantity = quantity;
    _serialNumbers = serialNumbers;
  }

  OrdersResponse.fromJson(dynamic json) {
    _quantity = json['quantity'];
    if (json['serialNumbers'] != null) {
      _serialNumbers = [];
      json['serialNumbers'].forEach((v) {
        _serialNumbers?.add(SerialNumbers.fromJson(v));
      });
    }
  }

  num? _quantity;
  List<SerialNumbers>? _serialNumbers;

  num get quantity => _quantity ?? -1;

  List<SerialNumbers> get serialNumbers => _serialNumbers ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    if (_serialNumbers != null) {
      map['serialNumbers'] = _serialNumbers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SerialNumbers {
  SerialNumbers({
    String? serialNumber,
    String? tourGuide,
    String? nationality,
    String? ticketTitle,
    num? price,
    String? createdAt,
  }) {
    _serialNumber = serialNumber;
    _tourGuide = tourGuide;
    _nationality = nationality;
    _ticketTitle = ticketTitle;
    _price = price;
    _createdAt = createdAt;
  }

  SerialNumbers.fromJson(dynamic json) {
    _serialNumber = json['serialNumber'];
    _tourGuide = json['tourGuide'];
    _nationality = json['nationality'];
    _ticketTitle = json['ticketTitle'];
    _price = json['price'];
    _createdAt = json['createdAt'];
  }

  String? _serialNumber;
  String? _tourGuide;
  String? _nationality;
  String? _ticketTitle;
  num? _price;
  String? _createdAt;

  String get serialNumber => _serialNumber ?? "";

  String get tourGuide => _tourGuide ?? "";

  String get nationality => _nationality ?? "";

  String get ticketTitle => _ticketTitle ?? "";

  num get price => _price ?? -1;

  String get createdAt => _createdAt ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serialNumber'] = _serialNumber;
    map['tourGuide'] = _tourGuide;
    map['nationality'] = _nationality;
    map['ticketTitle'] = _ticketTitle;
    map['price'] = _price;
    map['createdAt'] = _createdAt;
    return map;
  }
}
