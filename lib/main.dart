import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'dart:ui';
import 'package:todosaif/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme(),
      home: const HomeScreen(),
    );
  }
}
