// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_uit/util/user_type.dart';

class UserModel {
  String name;
  UserType userType;
  String ciu;
  String imageProfile;

  UserModel({
    required this.name,
    required this.userType,
    required this.ciu,
    required this.imageProfile,
  });

  UserModel.teste()
      : name = 'Wesley Medeiros da Cruz',
        userType = UserType.STUDENT,
        ciu = '80000',
        imageProfile =
            'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-PNG-File.png';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'userType': userType,
      'ciu': ciu,
      'imageProfile': imageProfile
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] as String,
        userType: map['userType'],
        ciu: map['ciu'] as String,
        imageProfile: map['imageProfile'] as String);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
