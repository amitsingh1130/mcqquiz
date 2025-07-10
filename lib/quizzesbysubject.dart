import 'package:flutter/material.dart';

class Quizzesbysubject extends StatefulWidget {
  const Quizzesbysubject({super.key});

  @override
  State<Quizzesbysubject> createState() => _QuizzesbysubjectState();
}

class _QuizzesbysubjectState extends State<Quizzesbysubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quizzes by subject'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text('Two'),),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Text('Go to Question by quizzes'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Go back to subject list'),
            ),
          ),
        ],
      ),
    );
  }
}
