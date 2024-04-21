import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/pressable_widget.dart';

class SelectionBoxes extends StatefulWidget {
  final List<String> options;
  final void Function(int)? onOptionSelected;

  SelectionBoxes({
    Key? key,
    required this.options,
    this.onOptionSelected,
  }) : super(key: key);

  @override
  _SelectionBoxesState createState() => _SelectionBoxesState();
}

class _SelectionBoxesState extends State<SelectionBoxes> {
  late int selectedId = 0; // Initialize selectedId here

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.options.length,
        (index) {
          final option = widget.options[index];
          final id = index;
          return PressableWidget(
            onPressed: () {
              setState(() {
                selectedId = id;
              });
              if (widget.onOptionSelected != null) {
                widget.onOptionSelected!(selectedId);
              }
            },
            child: Container(
              padding: EdgeInsets.all(2.0),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: id == selectedId ? Colors.blue : Colors.yellow,
              ),
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: id == selectedId ? Colors.white : Colors.yellow,
                    width: 1.0,
                  ),
                  color: id == selectedId ? Colors.blue : Colors.yellow,
                ),
                child: Text(
                  option,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
