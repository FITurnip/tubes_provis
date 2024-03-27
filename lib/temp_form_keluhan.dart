import 'package:flutter/material.dart';
import 'package:tubes/Pages/form_keluhan.dart';
import 'package:tubes/Pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormKeluhan(),
    );
  }
}
