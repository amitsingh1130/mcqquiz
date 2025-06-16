import 'package:flutter/material.dart';

class McqQuizStarter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,

              title: const Card(
                child: Text(
                  "Quiz App",
                  style: TextStyle(
                    fontSize: 49,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
      ),
    );
  }
}
