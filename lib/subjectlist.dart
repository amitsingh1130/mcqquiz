import 'package:flutter/material.dart';
import 'package:mcqquiz/utilities.dart';

class Subjectlist extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(title: Text('SubjectList'),centerTitle: true,),
        body: Column(
          children: [
            Center(
              child: ElevatedButton( child: Text('Mathematics'),
                onPressed: () {
                  print( 'Maths');
                  Utilities.currentquizname="Mathematics";
                  Utilities.currentquizurl="Url";
                   Navigator.pushNamed(context, '/second');
                },

              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print( 'English');
                  Utilities.currentquizname="English";
                  Utilities.currentquizurl="Url";
                   Navigator.pushNamed(context, '/second');
                },
                child: Text('English'),
              ),
            ),
          ],
        ),
      );

  }
}
