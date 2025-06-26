import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'classutilities.dart';

class VsjTwo extends StatefulWidget {
  int questionno = 0;
  String question = "";
  _VsjTwo createState() {
    return _VsjTwo();
  }
}

class _VsjTwo extends State<VsjTwo> with SingleTickerProviderStateMixin {
  String data = "";

  @override
  void initState()  {
    super.initState();
  // loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text(Utilities.currentquizname)),
      body: Column(children: [Text(widget.question),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          onPressed: (){
        print('sumit');
        widget.questionno++;
         setState(() {

        });
      }, child: Text(widget.questionno.toString())),
        Text(Utilities.questions[widget.questionno]['question'])


      ]),
    );
  }

}
