// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_uit/util/user_type.dart';

class UserModel {
  String name;
  UserType userType;
  String ciu;
  String imageProfile;
  String cep;
  String district;
  String street;
  String number;
  String city;
  String phone;
  String uf;
  String mail;

  UserModel({
    required this.name,
    required this.userType,
    required this.ciu,
    required this.imageProfile,
    required this.cep,
    required this.district,
    required this.street,
    required this.number,
    required this.city,
    required this.phone,
    required this.uf,
    required this.mail,
  });

  UserModel.teste()
      : name = 'Wesley Medeiros da Cruz',
        userType = UserType.STUDENT,
        ciu = '80000',
        cep = '35544000',
        city = 'São Gonçalo do Pará',
        district = 'Nossa Senhora Aparecida',
        mail = 'aluno0000@uit.br',
        phone = '99999999999',
        street = 'Nina Cruz',
        number = '100',
        uf = 'MG',
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
      imageProfile: map['imageProfile'] as String,
      cep: map['cep'] as String,
      city: map['city'] as String,
      district: map['district'] as String,
      mail: map['mail'] as String,
      number: map['number'] as String,
      phone: map['phone'] as String,
      street: map['street'] as String,
      uf: map['uf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
