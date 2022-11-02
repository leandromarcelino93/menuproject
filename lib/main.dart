import 'package:flutter/material.dart';
import 'package:menuproject/data/menu_inherited.dart';
import 'package:menuproject/screens/initialscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MenuInherited(child: const InitialScreen()),
    );
  }
}
