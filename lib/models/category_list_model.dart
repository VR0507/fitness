import 'dart:convert';

class CategoryListModel {
  final bool? status;
  final String? message;
  final String? messageIos;
  final List<Datum>? data;

  CategoryListModel({
    this.status,
    this.message,
    this.messageIos,
    this.data,
  });

  factory CategoryListModel.fromRawJson(String str) => CategoryListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
    status: json["status"],
    message: json["message"],
    messageIos: json["message_ios"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ios": messageIos,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? name;
  final String? icon;

  Datum({
    this.id,
    this.name,
    this.icon,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
  };
}
