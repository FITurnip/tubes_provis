import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/pressable_widget.dart';

class SelectionBoxes extends StatefulWidget {
  final List<String> options;
  final void Function(int)? onOptionSelected;
  final int defaultSelectedId;

  SelectionBoxes({
    Key? key,
    required this.options,
    this.defaultSelectedId = 0,
    this.onOptionSelected,
  }) : super(key: key);

  @override
  _SelectionBoxesState createState() => _SelectionBoxesState();
}

class _SelectionBoxesState extends State<SelectionBoxes> {
  late int selectedId;
  
  @override
  void initState() {
    super.initState();
    selectedId = widget.defaultSelectedId;
  }

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
                color: id == selectedId ? defBlue : basicYellow,
              ),
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: id == selectedId ? Colors.white : basicYellow,
                    width: 1.0,
                  ),
                  color: id == selectedId ? defBlue : basicYellow,
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
