import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/screens/login/login.dart';
import 'package:todosaif/utils/sizedbox.dart';

class Settings extends StatefulWidget {
  final String user;
  const Settings({Key? key, required this.user}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(children: [
          verticalBox(20),
          Container(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              heroTag: 'topRightSettingsCloseButton',
              onPressed: () {
                // Add your onPressed code here!
                Navigator.pop(context);
              },
              backgroundColor: colorBackground,
              elevation: 0,
              foregroundColor: colorPrimary,
              shape: const StadiumBorder(
                  side: BorderSide(color: colorAccent, width: 2.5)),
              child: const Icon(Icons.close),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Deactivate Account",
                    style: TextStyle(
                        fontFamily: 'Halenoir',
                        color: colorPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
                verticalBox(10),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      _showMyDialog(context, widget.user);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Delete Account',
                      style: TextStyle(
                          fontFamily: 'Halenoir',
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
          const Center(
            child: Text(
              'If not in use; delete your account kindly. \nIt helps us save data and the planet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Halenoir',
                  color: colorAccent,
                  fontWeight: FontWeight.w500),
            ),
          )
        ]),
      ),
    );
  }
}

Future<void> _showMyDialog(context, user) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Delete Account?',
          style: TextStyle(
              fontFamily: 'Halenoir',
              color: colorPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'By clicking "Delete", all the data stored in our server will be deleted and lost forever.',
                style: TextStyle(
                    fontFamily: 'Halenoir',
                    color: colorPrimary,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: Colors.white,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('No',
                style: TextStyle(
                    fontFamily: 'Halenoir',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: Colors.red,
              minimumSize: Size.zero,
              // padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Delete',
                style: TextStyle(
                    fontFamily: 'Halenoir',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
            onPressed: () async {
              var collection = FirebaseFirestore.instance.collection(user);
              var snapshots = await collection.get();
              for (var doc in snapshots.docs) {
                await doc.reference.delete();
              }
              Navigator.of(context).pop();
              print('User deleted');
              late SharedPreferences preferences;
              preferences = await SharedPreferences.getInstance();
              await preferences.remove('UserLocal');
              print('User deleted locally');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const LogIn())));
            },
          ),
        ],
      );
    },
  );
}
