import 'package:app_uit/protocols/protocol_page.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ProtocolViewPage extends StatefulWidget {
  const ProtocolViewPage({super.key});

  @override
  State<ProtocolViewPage> createState() => _ProtocolViewPageState();
}

class _ProtocolViewPageState extends State<ProtocolViewPage> {
  @override
  Widget build(BuildContext context) {
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
                'Protocolos e\nSolicitações',
                style: defaultTextStyleTitlePage,
                overflow: TextOverflow.ellipsis,
              ),
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
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProtocolPage(),
                          )),
                      child: Container(
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Text(
                                      'Solicitar novo protocolo',
                                      style: defaultTextTitleStyle,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.teal,
                                    size: 35,
                                  ),
                                ),
                              ])),
                    ),
                    _getCard('Solicitações em aberto'),
                    _getCard('Solicitações finalizadas')
                  ],
                ))),
          )
        ]));
  }

  Widget _getCard(String title) => Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      height: 200,
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
            title,
            style: defaultTextStyleSubtitle,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: getProtocols(),
          )
        ],
      ));

  List<Widget> getProtocols() {
    List<Widget> list;
    list = List.generate(3, (index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Envio de atividade complementar',
                style: defaultTextStyle,
              ),
              Text(
                '01/01/2022',
                style: defaultTextStyle,
              ),
            ],
          ),
          const Divider(
            color: Colors.teal,
          )
        ],
      );
    });
    return list;
  }
}
