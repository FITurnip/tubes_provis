import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class InputField extends StatefulWidget {
  final String labelText;

  const InputField({Key? key, required this.labelText}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: normalWhite,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: normalWhite))),
          child: TextField(
            style: TextStyle(color: normalWhite),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            "Password",
            style: TextStyle(
              color: normalWhite,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: normalWhite))),
          child: TextField(
            obscureText: _obscureText,
            style: TextStyle(color: normalWhite),
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: normalWhite,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
