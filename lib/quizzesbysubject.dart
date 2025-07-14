import 'package:flutter/material.dart';
import 'package:mcqquiz/utilities.dart';

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
        children: [Center(child: Text('Two'),),SizedBox(height: 40,),Center(child: Text(' ${Utilities.currentquizname}'),),
          SizedBox(height: 80,),Center(
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
