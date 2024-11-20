import 'package:flutter/material.dart';
import 'package:flutter_train_app/HomePage/center_choose_box.dart';
import 'package:flutter_train_app/HomePage/homepage.dart';
import 'package:flutter_train_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: theme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
