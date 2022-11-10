import 'package:flutter/material.dart';

import '../consts.dart';

class SimpleProtocolPage extends StatelessWidget {
  final String title;
  const SimpleProtocolPage({super.key, required this.title});

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
              child: Material(
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
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    title,
                                    style: textStyleButton,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Descrição',
                                    style: defaultTextlabelBoldStyle,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFAFAFA),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.teal)),
                                  child: const TextField(
                                    minLines: 10,
                                    maxLines: 20,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
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
                                        border: Border.all(
                                            width: .5, color: Colors.teal)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12.0),
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
                                Expanded(child: Container()),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: SizedBox(
                                    height: 55,
                                    width: size.width,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.teal.shade300)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Enviar',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ])))))
        ]));
  }
}
