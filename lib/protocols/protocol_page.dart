import 'package:flutter/material.dart';

import '../consts.dart';

class ProtocolPage extends StatefulWidget {
  const ProtocolPage({super.key});

  @override
  State<ProtocolPage> createState() => _ProtocolPageState();
}

class _ProtocolPageState extends State<ProtocolPage> {
  String? item1;
  String? item2;
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: 'Iniciação Científica', child: Text('Iniciação Científica')),
    const DropdownMenuItem(
        value: 'Publicação de Trabalho de Pesquisa',
        child: Text('Publicação de Trabalho de Pesquisa')),
    const DropdownMenuItem(value: 'Monitoria', child: Text('Monitoria')),
    const DropdownMenuItem(
        value: 'Projetos de extensão em áreas afins do curso',
        child: Text('Projetos de extensão em áreas afins do curso')),
    const DropdownMenuItem(
        value: 'Curso de idiomas', child: Text('Curso de idiomas')),
  ];
  List<DropdownMenuItem<String>> menuItems2 = [
    const DropdownMenuItem(value: 'Sim', child: Text('Sim')),
    const DropdownMenuItem(value: 'Não', child: Text('Não')),
  ];
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
          Material(
            type: MaterialType.transparency,
            child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.only(left: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.teal)),
                      child: DropdownButton(
                          value: item1,
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
                          onChanged: ((value) {
                            setState(() => item1 = menuItems
                                .singleWhere(
                                    (element) => element.value == value)
                                .value);
                          })),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _getcard('Carga horária:', _getTextField()),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(child: _getcard('Horário:', _getTextField())),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: _getcard('Data inicial:', _getTextField())),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                            child: _getcard('Data final:', _getTextField())),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _getcard('Telefone:', _getTextField())),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Atividade Presencial:',
                                  style: defaultTextlabelBoldStyle,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.teal)),
                                child: DropdownButton(
                                    value: item2,
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
                                      child: Text('Selecione'),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    items: menuItems2,
                                    onChanged: ((value) {
                                      setState(() => item2 = menuItems2
                                          .singleWhere((element) =>
                                              element.value == value)
                                          .value);
                                    })),
                              ),
                            ])),
                      ],
                    ),
                    _getcard('Local:', _getTextField()),
                    _getcard('Instituição:', _getTextField()),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        height: 55,
                        width: size.width,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset: const Offset(3, 3),
                                  color: Colors.grey.shade400)
                            ],
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: .5, color: Colors.teal)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Adicionar anexo',
                                style: textStyleButton,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 12.0),
                              child: Icon(
                                Icons.attach_file,
                                color: Colors.teal,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
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
                          onPressed: () {},
                          child: const Text(
                            'Enviar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
          )
        ]));
  }

  Widget _getTextField() {
    return const TextField(
        decoration: InputDecoration(border: InputBorder.none),
        style: TextStyle(
            fontSize: 16,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400));
  }

  Widget _getcard(String label, Widget child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              label,
              style: defaultTextlabelBoldStyle,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 45,
            decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal)),
            child: child,
          ),
        ],
      );
}
