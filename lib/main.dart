import 'package:flutter/material.dart';
import 'package:menuproject/data/menu_inherited.dart';
import 'package:menuproject/form_screen.dart';
import 'package:menuproject/initialscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

