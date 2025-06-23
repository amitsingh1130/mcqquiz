import 'package:flutter/material.dart';
import 'package:mcqquiz/utilities.dart';
class VsjOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: Text('VSJ One')),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Physics'),
              onPressed: () {
                Utilities.currentquizname="Physics";
                Utilities.currentquizurl="Url";
                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Maths'),
              onPressed: () {
                Utilities.currentquizname="Maths";
                Utilities.currentquizurl="Url";
                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
        ],
      ),
    );
  }
}