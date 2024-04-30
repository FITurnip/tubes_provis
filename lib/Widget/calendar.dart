import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Pages/list_dokter.dart';
import 'package:tubes/Services/network.dart';
import 'package:tubes/global_var.dart';
import 'package:tubes/theme.dart';
import 'package:flutter/cupertino.dart';

class CalendarApp extends StatefulWidget {
  final int pasien_id;
  final bool useBPJS;
  final String gejala;
  const CalendarApp(
      {super.key,
      required this.pasien_id,
      required this.useBPJS,
      required this.gejala});
  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late int _selectedJam;
  late int _selectedMenit;
  late List<Map<int, List<int>>> _daftarJadwal;
  late List<int> _listMenit;
  bool isSuccessGetJadwal = false;

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
                  borderRadius: BorderRadius.circular(20.0)),
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
                    weekendStyle: TextStyle(color: defBlue)),
                calendarStyle: CalendarStyle(
                    weekendTextStyle: TextStyle(color: defBlue),
                    outsideTextStyle: TextStyle(color: lightGrey),
                    todayTextStyle: TextStyle(color: blackColor),
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    selectedDecoration:
                        BoxDecoration(color: defBlue, shape: BoxShape.circle)),
                headerStyle: HeaderStyle(titleCentered: true),
                // enabledDayPredicate: _isEnableDay,
                onDaySelected: (selectedDay, focusedDay) async {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  await _getReadyJadwal();
                  if (isSuccessGetJadwal) {
                    _showDatePicker();
                  } else {
                    Navigator.of(context).pop();
                  }
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

  Future<void> _getReadyJadwal() async {
    var data = {
      'hari': DateFormat('EEEE', 'id_ID').format(_selectedDay).toString()
    };
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return loadingDialog;
        });
    var res = await Network().getData(data, 'masterdata/list-jadwal-dokter');
    if (res is String) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
        backgroundColor: statusRed,
      ));
    } else {
      var body = json.decode(res.body);
      if (body.containsKey('success')) {
        if (body['success']) {
          isSuccessGetJadwal = true;
          _daftarJadwal = body['data']['dropdownData']
              .map<Map<int, List<int>>>((e) => {
                    e['jam'] as int: e['menit']
                        .map<int>((menit) => menit as int)
                        .toList() as List<int>
                  })
              .toList();
          _selectedJam = _daftarJadwal[0].keys.first;
          _listMenit = _daftarJadwal.firstWhere(
              (element) => element.keys.first == _selectedJam)[_selectedJam]!;
          _selectedMenit = _listMenit[0];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(body['message']),
            backgroundColor: statusRed,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("500 Server error"),
          backgroundColor: statusRed,
        ));
      }
      Navigator.of(context).pop();
    }
  }

  void _showDatePicker() {
    isSuccessGetJadwal = false;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        // Create the modal bottom sheet widget containing the time picker and close button
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
              height: 300,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Column(
                  children: [
                    Text(
                      "Pilih Waktu",
                      style: getDefaultTextStyle(font_size: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            child: CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: 32,
                              onSelectedItemChanged: (int index) {
                                setState(() {
                                  _selectedJam =
                                      _daftarJadwal[index].keys.first;
                                  _listMenit = _daftarJadwal.firstWhere(
                                      (element) =>
                                          element.keys.first ==
                                          _selectedJam)[_selectedJam]!;
                                  _selectedMenit = _listMenit[0];
                                });
                              },
                              children: _daftarJadwal.map((value) {
                                return Center(
                                  child: Text(
                                    value.keys.first.toString().length == 1
                                        ? '0' + value.keys.first.toString()
                                        : value.keys.first.toString(),
                                    style: getDefaultTextStyle(font_size: 18),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Text(
                          ":",
                          style: getDefaultTextStyle(font_size: 18),
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            child: CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: 32,
                              onSelectedItemChanged: (int index) {
                                _selectedMenit = _listMenit[index];
                              },
                              children: _listMenit.map((value) {
                                return Center(
                                  child: Text(
                                    value.toString().length == 1
                                        ? '0' + value.toString()
                                        : value.toString(),
                                    style: getDefaultTextStyle(font_size: 18),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Text(
                          "WIB",
                          style: getDefaultTextStyle(font_size: 18),
                        )
                      ],
                    ),
                    // Close button
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 16.0), // Add margin/padding below the button
                      child: ElevatedButton(
                        onPressed: () {
                          // print([
                          //   DateFormat('EEEE', 'id_ID').format(_selectedDay),
                          //   _selectedJam,
                          //   _selectedMenit,
                          //   widget.pasien_id,
                          //   widget.useBPJS,
                          //   widget.gejala
                          // ]);
                          Object dataJadwal = {
                            'rawTgl': _selectedDay,
                            'hari': DateFormat('EEEE', 'id_ID')
                                .format(_selectedDay),
                            'waktu': _selectedJam.toString() +
                                ":" +
                                _selectedMenit.toString(),
                            'pasien_id': widget.pasien_id,
                            'useBPJS': widget.useBPJS,
                            'gejala': widget.gejala
                          };
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => ListDokter(
                                dataJadwal: dataJadwal,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF54d4da),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
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
              ));
        });
      },
    );
  }
}
