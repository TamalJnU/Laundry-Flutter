// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

List<PostModel> postsFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
    String? name;
    String? email;
    String? departmentId;
    int? department;
    int? gender;
    String? password;
    int? id;

    PostModel({
        this.name,
        this.email,
        this.departmentId,
        this.department,
        this.gender,
        this.password,
        this.id,
    });

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        name: json["name"],
        email: json["email"],
        departmentId: json["departmentId"],
        department: int.parse(json["department"]),
        gender: int.parse(json["gender"]),
        password: json["password"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "departmentId": departmentId,
        "department": department,
        "gender": gender,
        "password": password,
        "id": id,
    };
}
