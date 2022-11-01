import 'package:app_uit/models/student_class_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../consts.dart';
import '../models/subject_teacher_model.dart';
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
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.teal.shade300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.subject.name,
                  style: defaultTextStyleTitlePage,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Data: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
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
                    child: Column(children: _getMenus(listStudents)),
                  )))
        ]));
  }

  List<Widget> _getMenus(List<StudentClassModel> listStudents) {
    List<Widget> list = [];
    for (var element in listStudents) {
      list.add(_getCard(element));
    }
    list.add(const SizedBox(
      height: 30,
    ));
    return list;
  }

  Widget _getCard(StudentClassModel student) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (student.isPresent1) {
            if (student.isPresent2) {
              student.isPresent1 = false;
            }
            student.isPresent2 = true;
          } else {
            if (student.isPresent2) {
              student.isPresent2 = false;
            } else {
              student.isPresent1 = true;
            }
          }
        });
      },
      child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
          ),
          height: 55,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
              ]),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(student.imageProfile))),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                student.name,
                style: defaultTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            student.isPresent1
                ? Icon(
                    Icons.check_circle_outline,
                    color: Colors.green.shade300,
                    size: 40,
                  )
                : Icon(
                    Icons.close,
                    color: Colors.red.shade300,
                    size: 40,
                  ),
            student.isPresent2
                ? Icon(
                    Icons.check_circle_outline,
                    color: Colors.green.shade300,
                    size: 40,
                  )
                : Icon(
                    Icons.close,
                    color: Colors.red.shade300,
                    size: 40,
                  ),
          ])),
    );
  }
}
