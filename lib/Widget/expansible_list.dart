import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class ExpansibleItem {
  ExpansibleItem({
    this.icon,
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });

  Icon ? icon;
  Widget expandedValue;
  String headerValue;
  bool isExpanded;
}

class ExpansibleList extends StatefulWidget {
  final List<ExpansibleItem> items;

  ExpansibleList({Key? key, required this.items}) : super(key: key);

  @override
  State<ExpansibleList> createState() => _ExpansibleListState();
}

class _ExpansibleListState extends State<ExpansibleList> {
  late List<ExpansibleItem> _data;

  @override
  void initState() {
    super.initState();
    _data = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      dividerColor: Colors.transparent,
      materialGapSize: 2.0,
      children: _data.map<ExpansionPanel>((item) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              leading: (item.icon != null ? item.icon : null),
              title: Text(item.headerValue, style: getDefaultTextStyle(font_size: 16),)
            );
          },
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: item.expandedValue
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
