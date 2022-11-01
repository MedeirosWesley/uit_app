import 'dart:convert';

class SubjectStudentModel {
  String name;
  String grade1;
  String grade2;
  String grade3;
  String absence;
  String totalClasses;

  SubjectStudentModel({
    required this.name,
    required this.grade1,
    required this.grade2,
    required this.grade3,
    required this.absence,
    required this.totalClasses,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'grade1': grade1,
      'grade2': grade2,
      'grade3': grade3,
      'absence': absence,
      'totalClasses': totalClasses,
    };
  }

  factory SubjectStudentModel.fromMap(Map<String, dynamic> map) {
    return SubjectStudentModel(
      name: map['name'] as String,
      grade1: map['grade1'] as String,
      grade2: map['grade2'] as String,
      grade3: map['grade3'] as String,
      absence: map['absence'] as String,
      totalClasses: map['totalClasses'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectStudentModel.fromJson(String source) =>
      SubjectStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
