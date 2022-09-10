// ignore_for_file: must_be_immutable
class User {
  User({
    this.id,
    this.rolesId,
    this.email,
    this.name,
    this.photoProfile,
    this.birthday,
    this.jenisKelamin,
    this.statusPengguna
  });

  int? id;
  int? rolesId;
  String? email;
  String? name;
  String? photoProfile;
  String? birthday;
  String? jenisKelamin;
  String? statusPengguna;
  static String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: (json['id'] is String) ? int.parse(json['id']) : json['id'],
        rolesId: (json['roles_id'] is String)
            ? int.parse(json['roles_id'])
            : json['roles_id'],
        email: json["email"],
        name: json["name"],
        photoProfile: json["photo_profile"],
        birthday: json["birthday"],
        jenisKelamin: json["jenis_kelamin"],
        statusPengguna: json['status_pengguna']
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roles-id": rolesId,
        "email": email,
        "name": name,
        "photo_profile": photoProfile,
        "birthday": birthday,
        "jenis_kelamin": jenisKelamin,
        "status_pengguna": statusPengguna,
      };

  // // User compyWith({
  // //   int? id,
  // //   int? rolesId,
  // //   String? email,
  // //   String? name,
  // //   String? photoProfile,
  // //   String? birthday,
  // //   String? jenisKelamin,
  // // }) {
  // //   return User(
  // //     id: id,
  // //     rolesId: rolesId ?? this.rolesId,
  // //     email: email ?? this.email,
  // //     name: name ?? this.name,
  // //     photoProfile: photoProfile ?? this.photoProfile,
  // //     birthday: birthday ?? this.birthday,
  // //     jenisKelamin: jenisKelamin ?? this.jenisKelamin,
  // //   );
  // }
}

// To parse this JSON data, do
//
//     final restUser = restUserFromJson(jsonString);

// import 'dart:convert';

// RestUser restUserFromJson(String str) => RestUser.fromJson(json.decode(str));

// String restUserToJson(RestUser data) => json.encode(data.toJson());

// class RestUser {
//   RestUser({
//     this.meta,
//     this.data,
//   });

//   Meta? meta;
//   Data? data;

//   factory RestUser.fromJson(Map<String, dynamic> json) => RestUser(
//         meta: Meta.fromJson(json["meta"]),
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "meta": meta!.toJson(),
//         "data": data!.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.token,
//     this.user,
//   });

//   String? token;
//   User? user;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         token: json["token"],
//         user: User.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "token": token,
//         "user": user!.toJson(),
//       };
// }

// class User {
//   User({
//     this.data,
//   });

//   List<Datum>? data;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   Datum({
//     this.id,
//     this.username,
//     this.name,
//     this.photoProfile,
//     this.roles,
//   });

//   int? id;
//   String? username;
//   String? name;
//   String? photoProfile;
//   String? roles;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         username: json["username"],
//         name: json["name"],
//         photoProfile: json["photo_profile"],
//         roles: json["roles"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "name": name,
//         "photo_profile": photoProfile,
//         "roles": roles,
//       };
// }

// class Meta {
//   Meta({
//     this.messege,
//     this.code,
//     this.status,
//   });

//   String? messege;
//   int? code;
//   String? status;

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         messege: json["messege"],
//         code: json["code"],
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "messege": messege,
//         "code": code,
//         "status": status,
//       };
// }
