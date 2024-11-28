// To parse this JSON data, do
//
//     final mainLanguageResponseModel = mainLanguageResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ovolutter/core/helper/string_format_helper.dart';


MainLanguageResponseModel mainLanguageResponseModelFromJson(String str) => MainLanguageResponseModel.fromJson(json.decode(str));

String mainLanguageResponseModelToJson(MainLanguageResponseModel data) => json.encode(data.toJson());

class MainLanguageResponseModel {
  String? remark;
  String? status;
  List<String>? message;
  Data? data;

  MainLanguageResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory MainLanguageResponseModel.fromJson(Map<String, dynamic> json) => MainLanguageResponseModel(
        remark: json["remark"],
        status: json["status"],
        message: (json["message"] as List<dynamic>).toStringList(),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "remark": remark,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<Language>? languages;
  Map<String, dynamic>? file;
  String? imagePath;

  Data({
    this.languages,
    this.file,
    this.imagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: json["languages"] == null ? [] : List<Language>.from(json["languages"]!.map((x) => Language.fromJson(x))),
        file: json["file"].toString() == "[]" ? {} : json["file"],
        imagePath: json["image_path"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "file": file,
        "image_path": imagePath,
      };
}

class Language {
  String? id;
  String? name;
  String? code;
  String? isDefault;
  String? image;
  String? createdAt;
  String? updatedAt;

  Language({
    this.id,
    this.name,
    this.code,
    this.isDefault,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"].toString(),
        name: json["name"].toString(),
        code: json["code"].toString(),
        isDefault: json["is_default"].toString(),
        image: json["image"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "is_default": isDefault,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
