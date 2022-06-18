import 'package:beepbeep_app/predict/selectPredictPage.dart';
import 'package:flutter/material.dart';

class MyPredict extends StatelessWidget {
  const MyPredict({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SelectPredictPage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}