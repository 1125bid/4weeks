import 'package:flutter/material.dart';
import 'package:flutter_train_app/HomePage/center_choose_box.dart';
import 'package:flutter_train_app/HomePage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
