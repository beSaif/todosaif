import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/screens/home/home.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

AppBar appBar(_advancedDrawerController, _handleMenuButtonPressed) {
  return AppBar(
    leading: IconButton(
      onPressed: _handleMenuButtonPressed,
      icon: ValueListenableBuilder<AdvancedDrawerValue>(
        valueListenable: _advancedDrawerController,
        builder: (_, value, __) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            child: Icon(
              value.visible ? Icons.clear : Icons.menu,
              key: ValueKey<bool>(value.visible),
            ),
          );
        },
      ),
    ),
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
