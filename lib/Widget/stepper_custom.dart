import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class StepperCustom extends StatefulWidget {
  const StepperCustom({Key? key}) : super(key: key);

  @override
  _StepperCustomState createState() => _StepperCustomState();
}

class _StepperCustomState extends State<StepperCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 50), // Tambahkan padding kiri kanan
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.5),
          border: Border.all(
            color: basicYellow,
            width: 3,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: defBlue,
          ),
          child: Text(
            '1',
            style: getDefaultTextStyle(
              font_size: 20,
              font_color: normalWhite,
              font_weight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
