import 'package:flutter/material.dart';
import 'Calculator.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      home: Calculator(),
    );
  }
}
