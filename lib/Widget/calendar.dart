import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CalendarApp extends StatefulWidget {
  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  
  List<int> _selectedTime = [DateTime.now().hour, DateTime.now().minute];
  String time = "-";

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    
    initializeDateFormatting('id_ID', null);
  }

  bool _isEnableDay(DateTime day) {
    return day.weekday >= DateTime.monday && day.weekday <= DateTime.friday;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  todayTextStyle: TextStyle(color: blackColor),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: defBlue,
                    shape: BoxShape.circle
                  )
                ),
                headerStyle: HeaderStyle(
                  titleCentered: true
                ),
                // enabledDayPredicate: _isEnableDay,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  _showDatePicker();
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        // Create the modal bottom sheet widget containing the time picker and close button
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: Column(
            children: [
              // Time picker
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (newTime) {
                    setState(() {
                      _selectedTime = [newTime.hour, newTime.minute];
                      time = "${_selectedTime[0]} : ${_selectedTime[1]}";
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0), // Add margin/padding below the button
                child: ElevatedButton(
                  onPressed: () {
                    // _sendForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF54d4da),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: Text(
                        'Selanjutnya',
                        style: getDefaultTextStyle(
                          font_color: Colors.white,
                          font_size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}