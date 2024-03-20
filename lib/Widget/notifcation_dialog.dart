import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key ?key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Modal",
            style: TextStyle(color: Colors.black87, fontFamily: 'Overpass', fontSize: 20),
          ),
          elevation: 0.0
        ),
        backgroundColor: Colors.white,
        body: Container()
    );
  }
}