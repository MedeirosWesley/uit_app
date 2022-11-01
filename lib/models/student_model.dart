// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_uit/models/subject_student_model.dart';

class StudentModel {
  String course;
  List<SubjectStudentModel> subjects;

  StudentModel({
    required this.course,
    required this.subjects,
  });

  StudentModel.teste()
      : course = 'Ciência da Computação',
        subjects = List.generate(
          3,
          (index) => index == 1
              ? SubjectStudentModel(
                  name: 'Fundamentos téoricos da computação',
                  absence: '4',
                  grade1: '18',
                  grade2: '22',
                  grade3: '',
                  totalClasses: '20')
              : index == 2
                  ? SubjectStudentModel(
                      name: 'Redes II',
                      absence: '6',
                      grade1: '20',
                      grade2: '25',
                      grade3: '',
                      totalClasses: '40')
                  : SubjectStudentModel(
                      name: 'Programação paralela',
                      absence: '0',
                      grade1: '21',
                      grade2: '20',
                      grade3: '',
                      totalClasses: '40'),
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'course': course,
      'subjects': subjects.map((x) => x.toMap()).toList(),
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      course: map['course'] as String,
      subjects: List<SubjectStudentModel>.from(
        (map['subjects'] as List<int>).map<SubjectStudentModel>(
          (x) => SubjectStudentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
