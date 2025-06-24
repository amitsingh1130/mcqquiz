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
        crossAxisAlignment: CrossAxisAlignment. stretch,
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Maths'),
              onPressed: () {
                print('');
                Utilities.currentquizname = "Maths";
                Utilities.currentquizurl =
                    'https://amitsingh1130.github.io/myjsonfiles/maths.json';

                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Physics'),
              onPressed: () {
                print('');
                Utilities.currentquizname = "Physics";
                Utilities.currentquizurl =
                    'https://amitsingh1130.github.io/myjsonfiles/physics.json';

                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
        ],
      ),
    );
  }
}
