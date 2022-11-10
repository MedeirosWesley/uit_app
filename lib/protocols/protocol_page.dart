import 'package:flutter/material.dart';

import '../consts.dart';

class ProtocolPage extends StatefulWidget {
  const ProtocolPage({super.key});

  @override
  State<ProtocolPage> createState() => _ProtocolPageState();
}

class _ProtocolPageState extends State<ProtocolPage> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: 'value', child: Text('descricao'))
    ];
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
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFAFAFA),
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
                      Row(
                        children: [
                          Expanded(
                            child: _getcard(
                                'Carga horária:',
                                const TextField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                )),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: _getcard(
                                'Horário:',
                                const TextField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _getcard(
                                'Data inicial:',
                                const TextField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                )),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: _getcard(
                                'Data final:',
                                const TextField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _getcard(
                                'Telefone:',
                                const TextField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                )),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: _getcard(
                              'Atividade presencial:',
                              DropdownButton(
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
                                  items: menuItems,
                                  onChanged: ((value) {})),
                            ),
                          ),
                        ],
                      ),
                      _getcard(
                          'Local:',
                          const TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      _getcard(
                          'Instituição:',
                          const TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
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
                              border:
                                  Border.all(width: .5, color: Colors.teal)),
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.teal.shade300)),
                            onPressed: () {},
                            child: const Text(
                              'Enviar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ))),
            ),
          )
        ]));
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
            padding: const EdgeInsets.all(3),
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
