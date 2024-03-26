import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class ButtonSwap extends StatefulWidget {
  final Function(String) onTextChanged;

  ButtonSwap({required this.onTextChanged});

  @override
  _ButtonSwapState createState() => _ButtonSwapState();
}

class _ButtonSwapState extends State<ButtonSwap> {
  String buttonText = 'Email'; // Default text

  void _toggleText() {
    setState(() {
      buttonText = (buttonText == 'Email') ? 'Telepon' : 'Email';
      widget.onTextChanged(buttonText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: basicYellow,
        backgroundColor: normalWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: basicYellow),
        ),
        minimumSize: Size(140, 25),
      ),
      onPressed: () {
        _toggleText(); // Ketika tombol ditekan, ubah teks
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              color: basicYellow,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Icon(
            Icons.rotate_left_sharp,
            color: basicYellow,
          ),
        ],
      ),
    );
  }
}
