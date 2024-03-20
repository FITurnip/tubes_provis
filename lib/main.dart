import 'package:flutter/material.dart';
import 'package:tubes/Widget/bottom_nav.dart';
import 'package:tubes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: my_app_name,
      home: BottomNav(selectedIndex: 0),
    );
  }
}
