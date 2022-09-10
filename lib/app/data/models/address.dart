// ignore_for_file: must_be_immutable
class Province {
  Province({this.id, this.name, this.code});

  int? id;
  String? name;
  String? code;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: (json['id'] is String) ? int.parse(json['id']) : json['id'],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}

class City {
  City({this.id, this.name, this.code, this.provinceCode});

  int? id;
  String? name;
  String? code;
  String? provinceCode;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: (json['id'] is String) ? int.parse(json['id']) : json['id'],
        name: json["name"],
        code: json["code"],
        provinceCode: json["province_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "province_code": provinceCode,
      };
}

class District {
  District({this.id, this.name, this.code, this.cityCode});

  int? id;
  String? name;
  String? code;
  String? cityCode;

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: (json['id'] is String) ? int.parse(json['id']) : json['id'],
        name: json["name"],
        code: json["code"],
        cityCode: json["city_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "city_code": cityCode,
      };
}

class Village {
  Village({this.id, this.name, this.code, this.districtCode});

  int? id;
  String? name;
  String? code;
  String? districtCode;

  factory Village.fromJson(Map<String, dynamic> json) => Village(
        id: (json['id'] is String) ? int.parse(json['id']) : json['id'],
        name: json["name"],
        code: json["code"],
        districtCode: json["district_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "district_code": districtCode,
      };
}

class Address {
  Address(
      {this.id,
      this.name,
      this.provinceCode,
      this.cityCode,
      this.districtCode,
      this.villageCode,
      this.title,
      this.detailAddress,
      this.latitude,
      this.longitude});

  int? id;
  String? provinceCode;
  String? cityCode;
  String? districtCode;
  String? villageCode;
  String? name;
  String? title;
  String? detailAddress;
  String? latitude;
  String? longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: (json['id'] is String) ? int.parse(json['id']) : json['id'],
        provinceCode: json["province_code"],
        cityCode: json["city_code"],
        districtCode: json["district_code"],
        villageCode: json["village_code"],
        name: json["name"],
        title: json["title"],
        detailAddress: json["detail_address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_code": provinceCode,
        "city_code": cityCode,
        "district_code": districtCode,
        "village_code": villageCode,
        'name': name,
        'title': title,
        'detail_address': detailAddress,
        'latitude': latitude,
        'longitude': longitude
      };
}
