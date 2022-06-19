import 'package:beepbeep_app/chart/chartRouter.dart';
import 'package:beepbeep_app/login/loginPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beep! Beep!',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyRouter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
