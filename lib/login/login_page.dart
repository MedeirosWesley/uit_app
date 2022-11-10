import 'package:app_uit/consts.dart';
import 'package:app_uit/home/home_page.dart';
import 'package:app_uit/home/student_home_page.dart';
import 'package:app_uit/home/teacher_home_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.teal.shade200,
              Colors.teal,
              Colors.teal.shade200
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: size.height / 4,
                width: size.height / 3.5,
                child: Image.asset('assets/uit_logo.png')),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              height: size.height / 2.6,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Usuário',
                    style: defaultTextStyleBold,
                  ),
                  _customTextField(TextEditingController(), false),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Senha',
                    style: defaultTextStyleBold,
                  ),
                  _customTextField(TextEditingController(), true),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                    child: SizedBox(
                      height: 55,
                      width: size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.teal.shade300)),
                        onPressed: () =>
                            PersistentNavBarNavigator.pushDynamicScreen(
                          context,
                          screen: MaterialPageRoute(
                            builder: (context) =>
                                const HomePage(page: StudentHomePage()),
                          ),
                          withNavBar: true,
                        ),
                        onLongPress: () =>
                            PersistentNavBarNavigator.pushDynamicScreen(
                          context,
                          screen: MaterialPageRoute(
                            builder: (context) =>
                                const HomePage(page: TeacherHomePage()),
                          ),
                          withNavBar: true,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueci a senha',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customTextField(TextEditingController controller, bool obscure) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(left: 8),
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(.2),
          borderRadius: const BorderRadius.all(Radius.circular(13))),
      child: TextField(
        decoration: const InputDecoration(border: InputBorder.none),
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
