import 'package:flutter/material.dart';

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
      color: Colors.teal.shade200,
      child: Column(children: [
        Image.asset('assets/uit.png'),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(20),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Divider(),
              ),
              _getMenu(),
              _getMenu(),
              _getMenu(),
              _getMenu(),
            ]),
          ),
        )
      ]),
    );
  }

  _getMenu() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
          ]),
      child: Row(
        children: [
          Expanded(child: Column()),
          Icon(
            Icons.abc,
            size: 50,
          )
        ],
      ),
    );
  }
}
