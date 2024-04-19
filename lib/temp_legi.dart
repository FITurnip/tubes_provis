import 'package:flutter/material.dart';
import 'package:tubes/Pages/pilih_tanggal.dart';
import 'package:tubes/Pages/pilih_tanggal.dart';
import 'package:tubes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PilihTanggal(),
      debugShowCheckedModeBanner: false,
    );
  }
}