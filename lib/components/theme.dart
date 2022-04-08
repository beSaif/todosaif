import 'package:flutter/material.dart';

const colorPrimary = Color.fromRGBO(29, 42, 76, 1);
const colorAccent = Color.fromRGBO(178, 190, 219, 1);
const colorBackground = Color.fromRGBO(248, 250, 254, 1);
const drawerBackground = Color.fromRGBO(13, 31, 81, 1);
const navTextStyle = TextStyle(
    fontFamily: 'Halenoir',
    color: colorAccent,
    fontSize: 17,
    fontWeight: FontWeight.w400);

ThemeData customTheme() {
  return ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(248, 250, 254, 1));
}

// ignore: non_constant_identifier_names
CusTextStyle(Color color, double size, FontWeight weight) => TextStyle(
    fontFamily: 'Halenoir', color: color, fontSize: size, fontWeight: weight);
