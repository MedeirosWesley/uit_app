import 'package:app_uit/models/student_class_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../consts.dart';
import '../models/student_model.dart';
import '../models/subject_student_model.dart';
import '../models/subject_teacher_model.dart';
import '../models/user_model.dart';
import '../widgets/custom_label.dart';

class GradeTeacherPage extends StatefulWidget {
  final SubjectTeacherModel subject;
  const GradeTeacherPage({super.key, required this.subject});

  @override
  State<GradeTeacherPage> createState() => _GradeTeacherPageState();
}

class _GradeTeacherPageState extends State<GradeTeacherPage> {
  List<StudentClassModel> listStudents = StudentClassModel.getTeste();
  @override
  Widget build(BuildContext context) {
    List<StudentClassModel> listStudents = StudentClassModel.getTeste();

    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.teal.shade300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 30, right: 100),
            child: Text(
              widget.subject.name.replaceFirst(' ', '\n'),
              style: defaultTextStyleTitlePage,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF3F9FF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: getsubjectsMenus(listStudents),
                    ),
                  )))
        ]));
  }

  List<Widget> getsubjectsMenus(List<StudentClassModel> students) {
    List<Widget> list = [];
    for (var element in students) {
      list.add(_card(element));
    }
    list.add(const SizedBox(
      height: 50,
    ));
    return list;
  }

  Widget _card(StudentClassModel student) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            student.name,
            style: defaultTextStyleSubtitle,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'CIU: ${student.ciu}',
            style: defaultTextlabelStyle,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLabel(
                        label1: 'Nota 1',
                        label2: student.grade1 == '' ? '-' : student.grade1),
                    CustomLabel(
                        label1: 'Nota 2',
                        label2: student.grade2 == '' ? '-' : student.grade2),
                    CustomLabel(
                        label1: 'Nota 3',
                        label2: student.grade3 == '' ? '-' : student.grade3),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal)),
                    child: Material(
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          style: textStyleInput,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Nota 3',
                    style: defaultTextlabelStyle,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(double value1, double value2) {
    return List.generate(2, (i) {
      const fontSize = 10.0;
      const radius = 30.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.teal.shade300,
            value: value1,
            title: '${(100 - (value2 / value1 * 100)).truncate()}%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red.shade300,
            value: value2,
            title: '',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}
