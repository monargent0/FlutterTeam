import 'package:beepbeep_app/predict/tabPage.dart';
import 'package:beepbeep_app/predict/tabPage.dart';
import 'package:flutter/material.dart';

import 'main/d0.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Diary',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      routes: {
        '/Dday': (context) => const Dday(), // 로그인 화면
        // '/signup': (context) => const RegisterPage(), // 회원 가입 화면
        // 그 외 화면 이동은 MaterialRoute방식으로 사용
      },
      initialRoute: '/Dday',
      debugShowCheckedModeBanner: false,
    );
  }
}

// @@@@ user 테이블 이름 워크벤치에서 오류나서 users로 수정!! @@@@ 
// tree 연결 , add화면 추가 하면 끝! 


