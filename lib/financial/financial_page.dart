import 'package:flutter/material.dart';

import '../consts.dart';
import '../widgets/custom_label.dart';

class FinancialPage extends StatelessWidget {
  const FinancialPage({super.key});

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
              'Boletos de\nMensalidades',
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
                                _getCard(Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ciência da Computação',
                                            style: textStyleButton,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const CustomLabel(
                                            label1: 'Mês',
                                            label2: 'Novembro',
                                          ),
                                          const CustomLabel(
                                            label1: 'Valor',
                                            label2: '1356,03',
                                          ),
                                          const CustomLabel(
                                            label1: 'Desconto',
                                            label2: '606,53',
                                          ),
                                          const CustomLabel(
                                            label1: 'Parcela',
                                            label2: '749,50',
                                          ),
                                          const CustomLabel(
                                            label1: 'Venc.Parcela',
                                            label2: '11/11/2022',
                                          ),
                                          const CustomLabel(
                                            label1: 'Validade',
                                            label2: '20/12/2022',
                                          ),
                                        ]),
                                    IconButton(
                                        onPressed: (() {}),
                                        icon: const Icon(
                                          Icons.download,
                                          color: Colors.teal,
                                          size: 50,
                                        ))
                                  ],
                                ))
                              ])))))
        ]));
  }

  Widget _getCard(Widget child) => Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
      margin: const EdgeInsets.only(top: 15),
      height: 220,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
          ]),
      child: child);
}
