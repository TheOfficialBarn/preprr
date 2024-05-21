import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatefulWidget { //Since this page has updating elements (e.g. the date), it needs to be a stateful widget
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Calendar'),
          TableCalendar(
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            //Stylying below
            headerStyle: const HeaderStyle(
              formatButtonVisible: false, //Hides the 2 week button in the header
              titleCentered: true, //Centers the month
            ),
              ),
        ],
      ),
    );
  }
}