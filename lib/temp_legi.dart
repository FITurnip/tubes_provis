import 'package:flutter/material.dart';
import 'package:tubes/Pages/list_dokter.dart';
import 'package:tubes/Widget/bottom_nav.dart';
import 'package:tubes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListDokter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
