import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';

AppBar appBar() {
  return AppBar(
    iconTheme: const IconThemeData(color: colorAccent),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          )),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
          ))
    ],
  );
}
