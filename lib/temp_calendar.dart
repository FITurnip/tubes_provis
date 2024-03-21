// import 'package:tubes/Widget/calendar.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(body: Center(child: Calendar()),),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/theme.dart';

void main() {
  initializeDateFormatting('id_ID', null);
  runApp(CalendarApp());
}

class CalendarApp extends StatefulWidget {
  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  bool _isEnableDay(DateTime day) {
    return day.weekday >= DateTime.monday && day.weekday <= DateTime.friday;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar App'),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightDefBlue,
                borderRadius: BorderRadius.circular(20.0)
              ),
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(16.0),
              child: TableCalendar(
                locale: 'id_ID',
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                weekendDays: [DateTime.sunday],
                availableCalendarFormats: const {CalendarFormat.month: ''},
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: grey),
                  weekendStyle: TextStyle(color: defBlue)
                ),
                calendarStyle: CalendarStyle(
                  weekendTextStyle: TextStyle(color: defBlue),
                  outsideTextStyle: TextStyle(color: lightGrey),
                  selectedTextStyle: TextStyle(color: normalWhite),
                  todayTextStyle: TextStyle(color: blackColor),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                headerStyle: HeaderStyle(
                  titleCentered: true
                ),
                enabledDayPredicate: _isEnableDay,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
