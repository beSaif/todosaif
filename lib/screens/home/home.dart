import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/screens/addtask/addtask.dart';
import 'package:todosaif/screens/home/components/appbar.dart';
import 'package:todosaif/screens/home/components/body.dart';
import 'package:todosaif/screens/home/components/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(248, 250, 254, 1),
        drawer: drawer(),
        appBar: appBar(),
        body: const Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTask(),
              ),
            );
          },
          backgroundColor: colorPrimary,
          child: const Icon(Icons.add),
        ));
  }
}
