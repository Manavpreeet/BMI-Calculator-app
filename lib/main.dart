import 'package:flutter/material.dart';
import 'screens/inputPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Color(0xFF0e1023),
        primaryColor: Color(0xFF0e1023),
        scaffoldBackgroundColor: Color(0xFF0e1023),
      ),
      home: InputPage(),
    );
  }
}

