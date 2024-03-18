import 'package:flutter/material.dart';
import 'package:tubes/Controller/example_controller.dart';

class AppRoute extends StatelessWidget {
  const AppRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Route',
      routes: {
          '/': (context) => MainAppController().controller(),
        },
    );
  }
}