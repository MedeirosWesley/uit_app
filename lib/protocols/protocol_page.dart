import 'package:app_uit/consts.dart';
import 'package:flutter/material.dart';

import 'send_protocol_page.dart';

class ProtocolPage extends StatefulWidget {
  const ProtocolPage({super.key});

  @override
  State<ProtocolPage> createState() => _ProtocolPageState();
}

class _ProtocolPageState extends State<ProtocolPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.teal.shade300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            width: 12.0,
            height: 30,
          ),
          IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Nova\nSolicitação',
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
                      child:
                          Column(children: [_getCard('Selecione o Assunto')]))))
        ]));
  }

  Widget _getCard(String title) => Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
          SingleChildScrollView(
            child: Column(
              children: getProtocols(),
            ),
          )
        ],
      ));

  List<Widget> getProtocols() {
    List<Widget> list = [];
    list.add(getProtocol('Envio de atividade complementar'));
    list.add(getProtocol('Atestado de matrícula'));
    list.add(getProtocol('Atestado de frequência'));
    list.add(getProtocol('Requerimento de diploma'));
    list.add(getProtocol('Requerimento de histórico escolar'));
    list.add(getProtocol('Declaração de conclusão de curso'));
    list.add(getProtocol('Requerimento dispensa de diciplina'));
    return list;
  }

  Widget getProtocol(String label) => GestureDetector(
        onTap: (() => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SendProtocolPage()))),
        child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 8),
            height: 45,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal)),
            child: Text(
              label,
              style: defaultTextStyle,
            )),
      );
}
