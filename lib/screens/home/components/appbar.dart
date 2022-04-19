// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todosaif/components/theme.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:todosaif/screens/login/login.dart';

AppBar appBar(_advancedDrawerController, _handleMenuButtonPressed, context) {
  return AppBar(
    leading: IconButton(
      onPressed: _handleMenuButtonPressed,
      icon: ValueListenableBuilder<AdvancedDrawerValue>(
        valueListenable: _advancedDrawerController,
        builder: (_, value, __) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
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
      // IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.search,
      //     )),
      IconButton(
          onPressed: () async {
            late SharedPreferences preferences;
            preferences = await SharedPreferences.getInstance();
            await preferences.remove('UserLocal');
            print("Stored Local User: ${preferences.getString("UserLocal")}");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const LogIn()));
          },
          icon: const Icon(
            Icons.logout_outlined,
          ))
    ],
  );
}
