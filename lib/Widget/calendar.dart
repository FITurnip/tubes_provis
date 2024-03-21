import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class Calendar extends StatefulWidget {
  Calendar();

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: defBlue
          ),
          child: Column(
            children: [
              Container(child: Text("Februari")),
              Container(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  children: [
                    Text("01"),
                    Text("02"),
                  ],
                ),
              )
            ],
          ),
        );
  }
}