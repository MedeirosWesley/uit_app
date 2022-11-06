import 'package:app_uit/models/subject_teacher_model.dart';
import 'package:app_uit/models/teacher_model.dart';
import 'package:flutter/material.dart';

import '../consts.dart';
import '../grade_teacher/grade_teacher_page.dart';
import '../models/user_model.dart';
import '../presence_lauch/presence_page.dart';
import '../widgets/custom_label.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = UserModel.teste();
    TeacherModel teacher = TeacherModel.teste();
    Size size = MediaQuery.of(context).size;
    return Container(
        height: 200,
        width: size.width - 100,
        color: Colors.teal.shade300,
        child: Column(children: [
          Image.asset('assets/uit.png'),
          Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFF3F9FF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20, bottom: 10, right: 20, left: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(2, 2))
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(user.imageProfile))),
                            ),
                          ),
                          Expanded(
                              child: Text(
                            user.name,
                            style: defaultTextlabelBoldStyle,
                          )),
                          IconButton(
                              onPressed: (() {}),
                              icon: const Icon(
                                Icons.logout_rounded,
                                size: 25,
                                color: Colors.teal,
                              ))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                              children:
                                  getsubjectsMenus(teacher.subjects, context))),
                    ),
                  ])))
        ]));
  }

  List<Widget> getsubjectsMenus(
      List<SubjectTeacherModel> subjects, BuildContext context) {
    List<Widget> list = [];
    for (var element in subjects) {
      list.add(_card(element, context));
    }
    list.add(const SizedBox(
      height: 50,
    ));
    return list;
  }

  Widget _card(SubjectTeacherModel subject, BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
        ),
        height: 200,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  CustomLabel(
                    label1: 'Dia',
                    label2: subject.day,
                    size: 12,
                  ),
                  CustomLabel(
                    label1: 'Turno',
                    label2: subject.shift,
                    size: 12,
                  ),
                  CustomLabel(
                    label1: 'Início',
                    label2: subject.startDate,
                    size: 12,
                  ),
                  CustomLabel(
                    label1: 'Fim',
                    label2: subject.endDate,
                    size: 12,
                  ),
                  CustomLabel(
                    label1: 'Carga horária',
                    label2: subject.workload,
                    size: 12,
                  ),
                  CustomLabel(
                    label1: 'Modalidade',
                    label2: subject.modality,
                    size: 12,
                  ),
                ]),
            Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GradeTeacherPage(subject: subject),
                        )),
                    child: Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.teal)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.description_outlined,
                                size: 35,
                              ),
                              Text(
                                'Notas',
                                style: defaultTextStyle,
                              )
                            ],
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PresencePage(subject: subject),
                        )),
                    child: Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.teal)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.task_alt,
                                size: 35,
                              ),
                              Text(
                                'Frequência',
                                style: defaultTextStyle,
                              )
                            ],
                          ),
                        )),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
