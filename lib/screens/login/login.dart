// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todosaif/components/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:todosaif/screens/home/home.dart';
import 'package:todosaif/screens/login/components/welcome.dart';
import 'package:todosaif/utils/sizedbox.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late SharedPreferences preferences;
  final taskName = TextEditingController();
  var hintColor = colorAccent;
  var hintText = 'Enter username';
  double hintSize = 30;
  // ignore: prefer_typing_uninitialized_variables
  var user;
  var timing = 'morning';
  var priority = 'green';
  int dayIcon = 1;
  int priorityIcon = 1;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<String> init() async {
    preferences = await SharedPreferences.getInstance();
    user = preferences.getString("UserLocal");
    print("Stored User Found: $user");
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //floatingActionButton: ,
        //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print("Loading Home Page");
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => HomeScreen(user: user)));
            });
          } else if (!snapshot.hasData) {
            print("Loading Login Page");
            return LoaderOverlay(
              useDefaultLoading: false,
              overlayWidget: const Center(
                child: SpinKitFoldingCube(
                  color: colorPrimary,
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Let's sign you in.",
                              style: CusTextStyle(
                                  colorPrimary, 38, FontWeight.bold),
                            ),
                            verticalBox(15),
                            Text(
                              "Welcome back.",
                              style: CusTextStyle(
                                  colorPrimary, 28, FontWeight.w500),
                            ),
                            verticalBox(3),
                            Text(
                              "You've been missed!",
                              style: CusTextStyle(
                                  colorPrimary, 28, FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: taskName,
                                onChanged: (value) => {
                                  print('Task: ${taskName.text}'),
                                  user = value
                                },
                                style: const TextStyle(
                                    fontFamily: 'Halenoir',
                                    color: colorPrimary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () async {
                                        if (user == null) {
                                          print("Enter username");
                                        } else {
                                          context.loaderOverlay.show();
                                          final snapshot =
                                              await FirebaseFirestore.instance
                                                  .collection(user)
                                                  .get();

                                          if (snapshot.size == 0) {
                                            print("User: $user doesn't exist");
                                            print("Creating $user...");
                                            welcome(user);
                                            print("$user created.");
                                          } else {
                                            print("User: $user exists");
                                            preferences.setString(
                                                'UserLocal', user);
                                            print(preferences.get('UserLocal'));
                                          }

                                          await Future.delayed(
                                              const Duration(seconds: 2), () {
                                            context.loaderOverlay.hide();
                                          });
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen(user: user)));

                                          taskName.text = '';
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.send,
                                        color: colorPrimary,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: colorPrimary,
                                          width: 5,
                                        )),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: colorPrimary, width: 2.0),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: colorAccent,
                                        width: 2.0,
                                      ),
                                    ),
                                    hintText: hintText,
                                    hintStyle: TextStyle(
                                        fontFamily: 'Halenoir',
                                        color: hintColor,
                                        fontSize: hintSize,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                            horizontalBox(10),
                          ],
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: CusTextStyle(
                                    colorPrimary, 15, FontWeight.w500),
                              ),
                              Text("Type a username to create account.",
                                  style: CusTextStyle(
                                      colorPrimary, 15, FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
