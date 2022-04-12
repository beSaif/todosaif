// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/models/tasks.dart';
import 'package:todosaif/screens/addtask/addtask.dart';
import 'package:todosaif/screens/home/components/appbar.dart';
import 'package:todosaif/screens/home/components/body.dart';
import 'package:todosaif/screens/home/components/drawer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeScreen extends StatefulWidget {
  final String user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List? tasksFetch;
  List<Task>? tasks;

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: drawerBackground,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: drawer(_advancedDrawerController, widget.user, context),
      child: Scaffold(
          //backgroundColor: const Color.fromRGBO(248, 250, 254, 1),
          appBar: appBar(
              _advancedDrawerController, _handleMenuButtonPressed, context),
          body: Body(
            user: widget.user,
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'bottomRightAddTaskButton',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTask(user: widget.user),
                ),
              );
            },
            backgroundColor: colorPrimary,
            child: const Icon(Icons.add),
          )),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
