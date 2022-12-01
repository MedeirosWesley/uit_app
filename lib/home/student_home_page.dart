import 'package:app_uit/calendar/calendar_page.dart';
import 'package:app_uit/consts.dart';
import 'package:app_uit/models/user_model.dart';
import 'package:app_uit/widgets/home_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../financial/financial_page.dart';
import '../grade_studant/grade_page_studant.dart';
import '../login/login_page.dart';
import '../protocols/protocols_overview_page.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    UserModel user = UserModel.teste();
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
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(user.imageProfile))),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: defaultTextlabelBoldStyle,
                        ),
                        Text(
                          user.ciu,
                          style: defaultTextlabelBoldStyle,
                        ),
                      ],
                    )),
                    IconButton(
                        onPressed: (() =>
                            PersistentNavBarNavigator.pushDynamicScreen(
                              context,
                              screen: MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              withNavBar: false,
                            )),
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
                            builder: (context) => const ProtocolOverviewPage(),
                          )),
                    ),
                    HomeMenu(
                      icon: Icons.event,
                      title: 'Calendário',
                      label: 'Consultar o calendário escolar',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalendarPage(),
                          )),
                    ),
                    HomeMenu(
                      icon: Icons.note_add_outlined,
                      title: 'Financeiro',
                      label: 'Consultar boletos de mensalidades',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FinancialPage(),
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
