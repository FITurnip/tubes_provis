import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Pages/Auth/register_page.dart';
import 'package:tubes/Pages/riwayat.dart';
import 'package:tubes/Services/check_auth.dart';
import 'package:tubes/Widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Pages/Auth/login_page.dart';

void main() {
  initializeDateFormatting('id_ID', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Riwayat(),
      debugShowCheckedModeBanner: false,
      title: my_app_name,
    );
  }
}
