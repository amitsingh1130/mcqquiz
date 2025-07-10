import 'package:flutter/material.dart';
import 'package:mcqquiz/subjectlist.dart';
import 'package:mcqquiz/questionbyquizzes.dart';
import 'package:mcqquiz/quizzesbysubject.dart';
 void main() {
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Subjectlist(),
        '/second': (context) => Quizzesbysubject(),
        '/third': (context) => Questionbyquizzes(),
      },
    );
  }
}