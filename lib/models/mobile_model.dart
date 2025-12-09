// To parse this JSON data, do
//
//     final mobileModel = mobileModelFromJson(jsonString);

import 'dart:convert';

List<MobileModel> mobileModelFromJson(String str) => List<MobileModel>.from(json.decode(str).map((x) => MobileModel.fromJson(x)));

String mobileModelToJson(List<MobileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MobileModel {
    int userId;
    int id;
    String title;
    String body;

    MobileModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory MobileModel.fromJson(Map<String, dynamic> json) => MobileModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
