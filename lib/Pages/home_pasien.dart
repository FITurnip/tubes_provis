import 'package:flutter/material.dart';
import 'package:tubes/Widget/list_item.dart';
import 'package:tubes/theme.dart';

class HomePasien extends StatefulWidget {
  const HomePasien({super.key});

  @override
  State<HomePasien> createState() => _HomePasienState();
}

class _HomePasienState extends State<HomePasien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SIRAJA',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        backgroundColor: redColor,
      ),
      body: const SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListItem(),
            ),
          ],
        ),
      ),
    );
  }
}
