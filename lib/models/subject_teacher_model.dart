import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SubjectTeacherModel {
  String name;
  String day;
  String shift;
  String startDate;
  String endDate;
  String workload;
  String modality;

  SubjectTeacherModel({
    required this.name,
    required this.day,
    required this.shift,
    required this.startDate,
    required this.endDate,
    required this.workload,
    required this.modality,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'day': day,
      'shift': shift,
      'startDate': startDate,
      'endDate': endDate,
      'workload': workload,
      'modality': modality,
    };
  }

  factory SubjectTeacherModel.fromMap(Map<String, dynamic> map) {
    return SubjectTeacherModel(
      name: map['name'] as String,
      day: map['day'] as String,
      shift: map['shift'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
      workload: map['workload'] as String,
      modality: map['modality'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectTeacherModel.fromJson(String source) =>
      SubjectTeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
