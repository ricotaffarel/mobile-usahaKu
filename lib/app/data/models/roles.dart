// ignore_for_file: must_be_immutable
class Roles {
  Roles({this.id, this.name});

  int? id;
  String? name;

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
        id: (json['id'] is String) ? int.parse(json['id']) : json['id'],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
