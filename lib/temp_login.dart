import 'package:flutter/material.dart';
import 'package:tubes/Pages/Auth/login_page.dart';
import 'package:tubes/Pages/Auth/register_page.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Pages/Pasien/pembayaran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
