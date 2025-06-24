import 'package:flutter/material.dart';
import 'vsjone.dart';
import 'vsjtwo.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => Subject(), '/second': (context) => VsjTwo()},
    ),
  );
}

class QuizQuestion {
  final int qno;
  final String question;
  final String opa;
  final String opb;
  final String opc;
  final String opd;
  final String correctanswer;

  QuizQuestion({
    required this.qno,
    required this.question,
    required this.opa,
    required this.opb,
    required this.opc,
    required this.opd,
    required this.correctanswer,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      qno: json['qno'],
      question: json['question'],
      opa: json['opa'],
      opb: json['opb'],
      opc: json['opc'],
      opd: json['opd'],
      correctanswer: json['correctanswer'],
    );
  }
}
