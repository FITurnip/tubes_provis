import 'package:flutter/material.dart';
import 'package:tubes/Model/example_model.dart';

class MainAppView extends StatelessWidget {
  MainAppView({super.key});

  final MainAppModel mainAppModel = MainAppModel("Braderr!!!");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello  ${mainAppModel.getNama()}'),
        ),
      ),
    );
  }
}
