import 'package:flutter/material.dart';

import '../consts.dart';

class SendProtocolPage extends StatefulWidget {
  const SendProtocolPage({super.key});

  @override
  State<SendProtocolPage> createState() => _SendProtocolPageState();
}

class _SendProtocolPageState extends State<SendProtocolPage> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text('descricao'), value: 'value')
    ];
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.teal.shade300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 30,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Nova\nSolicitação',
                style: defaultTextStyleTitlePage,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF3F9FF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.teal)),
                        child: DropdownButton(
                            focusColor: Colors.transparent,
                            underline: Container(),
                            icon: const Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.teal,
                              size: 40,
                            ),
                            isExpanded: true,
                            hint: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Tipo de atividade'),
                            ),
                            borderRadius: BorderRadius.circular(12),
                            items: menuItems,
                            onChanged: ((value) {})),
                      ),
                      _getcard(
                          'Carga horária:',
                          const TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ))
                    ]),
                  ))),
            ),
          )
        ]));
  }

  Widget _getcard(String label, Widget child) => Column(
        children: [
          Text(
            label,
            style: defaultTextlabelStyle,
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal)),
            child: child,
          ),
        ],
      );
}
