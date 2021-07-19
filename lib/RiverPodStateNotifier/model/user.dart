import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'user_data.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({required this.data,});

  UserData data;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  factory User.fromJson(Map<String, dynamic> json) => User (
    data: UserData.fromJson(json["data"]),
  );

}