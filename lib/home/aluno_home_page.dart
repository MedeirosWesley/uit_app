import 'package:app_uit/consts.dart';
import 'package:app_uit/widgets/home_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../grade_studant/grade_page_studant.dart';

class AlunoHomePage extends StatefulWidget {
  const AlunoHomePage({Key? key}) : super(key: key);

  @override
  State<AlunoHomePage> createState() => _AlunoHomePageState();
}

class _AlunoHomePageState extends State<AlunoHomePage> {
  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-PNG-File.png'))),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      'Wesley Medeiros da Cruz',
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    HomeMenu(
                      icon: Icons.task_outlined,
                      title: 'Notas e faltas',
                      label: 'Consultar suas notas e faltas',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GradePage(),
                          )),
                    ),
                    HomeMenu(
                      icon: Icons.description_outlined,
                      title: 'Protocolos',
                      label: 'Consultar e solicitar protocolos',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GradePage(),
                          )),
                    ),
                    HomeMenu(
                      icon: Icons.event,
                      title: 'Calendário',
                      label: 'Consultar o calendário escolar',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GradePage(),
                          )),
                    ),
                    HomeMenu(
                      icon: Icons.note_add_outlined,
                      title: 'Financeiro',
                      label: 'Consultar boletos e mensalidades',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GradePage(),
                          )),
                    ),
                  ],
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}