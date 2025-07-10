import 'package:flutter/material.dart';
import 'package:mcqquiz/questionbyquizzes.dart';

class Questionbyquizzes extends StatefulWidget {
  const Questionbyquizzes({super.key});

  @override
  State<Questionbyquizzes> createState() => _QuestionbyquizzesState();
}

class _QuestionbyquizzesState extends State<Questionbyquizzes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Question by quizzes'), centerTitle: true),
      body: Column(
        children: [Center(child: Text('Three'),),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back to quizzes by subject'),
            ),
          ),
        ],
      ),
    );
  }
}
