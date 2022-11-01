import 'package:app_uit/consts.dart';
import 'package:app_uit/models/student_model.dart';
import 'package:app_uit/models/user_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/subject_student_model.dart';
import '../widgets/custom_label.dart';

class GradePage extends StatelessWidget {
  const GradePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = UserModel.teste();
    StudentModel student = StudentModel.teste();
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.teal.shade300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  student.course,
                  style: defaultTextStyleTitlePage,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${user.name} - ${user.ciu}',
                  style: defaultTextStyleUserTitle,
                )
              ],
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
                      children: getsubjectsMenus(student.subjects),
                    ),
                  )))
        ]));
  }

  List<Widget> getsubjectsMenus(List<SubjectStudentModel> subjects) {
    List<Widget> list = [];
    for (var element in subjects) {
      list.add(_card(element));
    }
    list.add(const SizedBox(
      height: 50,
    ));
    return list;
  }

  double getTotalgrade(String value1, String value2, String value3) {
    if (value1 == '') return 0;
    if (value2 == '') return double.parse(value1);
    if (value3 == '') return double.parse(value1) + double.parse(value1);
    return double.parse(value1) + double.parse(value1) + double.parse(value3);
  }

  Widget _card(SubjectStudentModel subject) {
    double totalGrade =
        getTotalgrade(subject.grade1, subject.grade2, subject.grade3);
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      height: 220,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject.name,
            style: defaultTextStyleSubtitle,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabel(
                      label1: 'Nota 1',
                      label2: subject.grade1 == '' ? '-' : subject.grade1),
                  CustomLabel(
                      label1: 'Nota 2',
                      label2: subject.grade2 == '' ? '-' : subject.grade2),
                  CustomLabel(
                      label1: 'Nota 3',
                      label2: subject.grade3 == '' ? '-' : subject.grade3),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(8),
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.teal)),
                      child: Center(
                        child: Text(
                          totalGrade.toString(),
                          style: defaultTextStyleInput,
                        ),
                      )),
                  Text(
                    'Total parcial',
                    style: defaultTextlabelStyle,
                  )
                ],
              )
            ],
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Faltas:', style: defaultTextStyle),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    subject.absence,
                    style: defaultTextStyleInput,
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: PieChart(
                        PieChartData(
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 2,
                          centerSpaceRadius: 0,
                          sections: showingSections(
                              double.parse(subject.totalClasses),
                              double.parse(subject.absence)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Percentual',
                    style: defaultTextlabelStyle,
                  )
                ],
              )
            ],
          )
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
