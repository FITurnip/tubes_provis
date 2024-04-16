import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/theme.dart';

class CalendarApp extends StatefulWidget {
  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  List<DateTime> _selectedDays = [];
  List<DateTime> _selectableDays = [
    DateTime(2024, 4, 16),
    DateTime(2024, 4, 20),
    DateTime(2024, 4, 25),
  ];

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    
    initializeDateFormatting('id_ID', null);
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
                firstDay: DateTime(2020, 1, 1),
                lastDay: DateTime(2030, 12, 31),
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
                  cellMargin: EdgeInsets.only(top: 0.0),
                  weekendTextStyle: TextStyle(color: defBlue),
                  outsideTextStyle: TextStyle(color: lightGrey),
                  selectedTextStyle: TextStyle(color: normalWhite),
                  selectedDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: defBlue,
                  ),
                  todayTextStyle: TextStyle(color: blackColor),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                headerStyle: HeaderStyle(
                  titleCentered: true
                ),
                rowHeight: 40.0,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    DateTime reformatedSelectedDay = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
                    if (_selectableDays.contains(reformatedSelectedDay)) {
                      if (_selectedDays.contains(selectedDay)) {
                        _selectedDays.remove(selectedDay);
                      } else {
                        _selectedDays.add(selectedDay);
                      }
                    }
                  });
                },
                selectedDayPredicate: (day) {
                  return _selectedDays.contains(day);
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) => setScheduleStyle(day),
                  todayBuilder: (context, day, focusedDay) => setScheduleStyle(day),
                  // holidayBuilder: (context, day, focusedDay) {
                  //   return Center(
                  //     child: Text(
                  //       '${day.day}',
                  //       style: TextStyle(
                  //         color: defBlue,
                  //       ),
                  //     ),
                  //   );
                  // },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Center setScheduleStyle(DateTime day) {
    DateTime reformatedDay = DateTime(day.year, day.month, day.day);
    bool isSelectableDay = _selectableDays.contains(reformatedDay);
    bool isWeekday = (reformatedDay.weekday != DateTime.sunday);
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: isSelectableDay ? defBlue : Colors.transparent,
          ),
        ),
        child: Text(
          '${day.day}',
          style: TextStyle(
            color: isSelectableDay ? defBlue : (isWeekday ? grey : defBlue),
          ),
        ),
      ),
    );
  }
}
