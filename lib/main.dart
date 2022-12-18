import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MG Cars'),
      ),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  String? user;
  String? pass;
  bool _validateUser = false;
  bool _validatePass = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: userController,
              decoration: InputDecoration(
                  errorText: _validateUser ? 'Cant user name be empty' : null,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.supervised_user_circle),
                  labelText: "Enter your user name"),
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: passController,
              decoration: InputDecoration(
                  errorText: _validatePass
                      ? 'Cant password be empty or less than 8 chars!'
                      : null,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.password),
                  labelText: "Enter your password"),
              onChanged: (value) {},
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  userController.text.isEmpty
                      ? _validateUser = true
                      : _validateUser = false;
                  passController.text.isEmpty || passController.text.length < 8
                      ? _validatePass = true
                      : _validatePass = false;
                });
                //If user and pass are OK then move to the main screen
              },
              child: const Text('Login'))
        ],
      ),
    );
  }
}
