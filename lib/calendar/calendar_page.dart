import 'package:app_uit/consts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math' as math;

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

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
              'Calendário\nEscolar',
              style: defaultTextStyleTitlePage,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(12),
            width: size.width,
            decoration: const BoxDecoration(
                color: Color(0xFFF3F9FF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SfCalendar(
              timeZone: 'E. South America Standard Time',
              dataSource: MeetingDataSource(_getDataSource()),
              view: CalendarView.month,
              monthViewSettings: const MonthViewSettings(
                showAgenda: true,
              ),
            ),
          ))
        ]));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Prova - Computação Paralela',
        startTime,
        endTime,
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        false));

    meetings.add(Meeting(
        'Entrega de atividade - AEDS III',
        startTime.add(const Duration(days: 5)),
        startTime.add(const Duration(days: 5)),
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        false));

    meetings.add(Meeting(
        'Prova - Redes II',
        startTime.add(const Duration(days: 8)),
        startTime.add(const Duration(days: 8)),
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        false));

    meetings.add(Meeting(
        'Entrega de atividade - Computação Paralela',
        endTime,
        endTime,
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        false));

    meetings.add(Meeting(
        'Entrega de atividade - Redes II',
        startTime.add(const Duration(days: 15)),
        startTime.add(const Duration(days: 15)),
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        false));

    meetings.add(Meeting(
        'Entrega de atividade - Computação Paralela',
        startTime.add(const Duration(days: 14)),
        startTime.add(const Duration(days: 14)),
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        false));

    meetings.add(Meeting(
        'Entrega de atividade - Trabalho Orientado II',
        startTime.add(const Duration(days: 20)),
        startTime.add(const Duration(days: 20)),
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        false));

    meetings.add(Meeting(
        'Prova - AEDS III',
        startTime.add(const Duration(days: 26)),
        startTime.add(const Duration(days: 26)),
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
