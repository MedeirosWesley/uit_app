import 'dart:convert';

import 'package:app_uit/models/subject_teacher_model.dart';

class TeacherModel {
  List<SubjectTeacherModel> subjects;

  TeacherModel({
    required this.subjects,
  });

  TeacherModel.teste()
      : subjects = List.generate(
            2,
            (index) => index == 1
                ? SubjectTeacherModel(
                    name: 'Projeto Orientado I',
                    day: 'Quinta-feira',
                    shift: 'Noturno',
                    startDate: '02/02/2022',
                    endDate: '31/06/2022',
                    workload: '72 h',
                    modality: 'Presencial')
                : SubjectTeacherModel(
                    name: 'Programação Paralela',
                    day: 'Quarta-feira',
                    shift: 'Noturno',
                    startDate: '02/02/2022',
                    endDate: '31/06/2022',
                    workload: '36 h',
                    modality: 'Presencial'));

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjects': subjects.map((x) => x.toMap()).toList(),
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      subjects: List<SubjectTeacherModel>.from(
        (map['subjects'] as List<int>).map<SubjectTeacherModel>(
          (x) => SubjectTeacherModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
