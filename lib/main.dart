import 'package:flutter/material.dart';
import 'package:kuppony/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kuppony',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orangeAccent,
        brightness: Brightness.light,
      ),
      home: HomeScreen(),
    );
  }
}
