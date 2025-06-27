import 'package:flutter/material.dart';
import 'package:mcqquiz/classutilities.dart';

class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: Text('Subject')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.  center,

        children: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(250, 60),
                backgroundColor: Colors.tealAccent,
              ),
              child: Text('Maths', style: TextStyle(fontSize: 28, color: Colors.black),
              ),
              onPressed: () async {
                print('');
                child: Utilities.currentquizname = "Maths";
                Utilities.currentquizurl =
                ('https://amitsingh1130.github.io/myjsonfiles/maths.json');
                await Utilities.loadQuestions();
                 Navigator.pushNamed(context, '/second',);
              },

            ),
          ),
          SizedBox(
          width: 1000,
          height: 70,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(300, 64),
                backgroundColor: Colors.lightGreenAccent,
              ),
              child: Text('Physics', style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              onPressed: () async {
                print('');
                Utilities.currentquizname = "Physics";
                Utilities.currentquizurl =
                    'https://amitsingh1130.github.io/myjsonfiles/physics.json';
                await Utilities.loadQuestions();
                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
          ),
         Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(350, 68),backgroundColor: Colors.green),
              child: Text(
                'Chemistry',
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),
              onPressed: () async {
                print('object');
                Utilities.currentquizname = "Chemistry";
                Utilities.currentquizurl =
                    "https://amitsingh1130.github.io/myjsonfiles/Chemistry.json";
                await Utilities.loadQuestions();
                Utilities.currentquizoption;
               Navigator.pushNamed(context, '/second');
              },
            ),
          ),

        ],
      ),
    );
  }
}
