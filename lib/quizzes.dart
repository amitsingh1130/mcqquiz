import 'package:flutter/material.dart';
import 'package:mcqquiz/main.dart';
class Quizzes extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.blueAccent,
    appBar: AppBar(title: Text('Quiz App'),backgroundColor: Colors.teal,),
  body: QuizPage(


  ),
  ),
);
  }
}

