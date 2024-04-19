import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class NextButtonRegister extends StatelessWidget {
  final String nextPage;

  const NextButtonRegister({Key? key, required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: defBlue,
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_forward_rounded,
            size: 35,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, nextPage);
          },
        ),
      ),
    );
  }
}
