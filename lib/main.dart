import 'package:flutter/material.dart';
import 'package:mcqquiz/quizzesbysubject.dart';
import 'subjectlist.dart';
import 'quizzesbysubject.dart';
void main() {
  runApp(MaterialApp(initialRoute: '/',
     routes: {'/': (context) => Subjectlist(), '/second': (context) => quizzesbysubject()},
  ));
}
