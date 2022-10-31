import 'package:app_uit/consts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradePage extends StatelessWidget {
  const GradePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.teal.shade300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ciência da\nComputação',
                  style: defaultTextStyleTitlePage,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Wesley Medeiros da Cruz - 80000',
                  style: defaultTextStyleUserTitle,
                )
              ],
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
                  child: Column(
                    children: [_card()],
                  )))
        ]));
  }

  Widget _card() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      height: 220,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
          ]),
      child: Column(
        children: [
          Text(
            'Fundamentos Téoricos da Computação',
            style: defaultTextStyleSubtitle,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  custonLabel('Nota 1', '20'),
                  custonLabel('Nota 2', '22'),
                  custonLabel('Nota 3', '-'),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal)),
                    child: Material(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        style: defaultTextStyleInput,
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Total parcial',
                    style: defaultTextlabelStyle,
                  )
                ],
              )
            ],
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Faltas:', style: defaultTextStyle),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '4',
                    style: defaultTextStyleInput,
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: PieChart(
                        PieChartData(
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 2,
                          centerSpaceRadius: 0,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Percentual',
                    style: defaultTextlabelStyle,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget custonLabel(String label1, String label2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label1: ',
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              decoration: TextDecoration.none),
          overflow: TextOverflow.fade,
          maxLines: 3,
        ),
        Text(
          label2,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              decoration: TextDecoration.none),
          overflow: TextOverflow.fade,
          maxLines: 3,
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      const fontSize = 12.0;
      const radius = 30.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.teal.shade300,
            value: 70,
            title: '70%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red.shade300,
            value: 30,
            title: '',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}
