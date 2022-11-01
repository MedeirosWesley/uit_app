import 'dart:convert';

class StudentClassModel {
  String name;
  String ciu;
  String imageProfile;
  bool isPresent1;
  bool isPresent2;

  StudentClassModel({
    required this.name,
    required this.ciu,
    required this.imageProfile,
    required this.isPresent1,
    required this.isPresent2,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ciu': ciu,
      'imageProfile': imageProfile,
      'isPresent1': isPresent1,
      'isPresent2': isPresent2,
    };
  }

  factory StudentClassModel.fromMap(Map<String, dynamic> map) {
    return StudentClassModel(
      name: map['name'] as String,
      ciu: map['ciu'] as String,
      imageProfile: map['imageProfile'] as String,
      isPresent1: map['isPresent1'] as bool,
      isPresent2: map['isPresent2'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentClassModel.fromJson(String source) =>
      StudentClassModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
