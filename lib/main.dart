import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: QuizPage(),
    debugShowCheckedModeBanner: false,
  ));
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

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<QuizQuestion> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _isLoading = true;
  bool _answered = false;
  String _selected = "";

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final response = await http.get(Uri.parse(
        'https://amitsingh1130.github.io/myjsonfiles/math.json'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      setState(() {
        _questions = data.map((e) => QuizQuestion.fromJson(e)).toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load quiz');
    }
  }


  void checkAnswer(String selectedOption) {
    if (_answered) return;

    setState(() {
      _selected = selectedOption;
      _answered = true;

      if (selectedOption == _questions[_currentIndex].correctanswer) {
        _score++;
      }
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _currentIndex++;
        _answered = false;
        _selected = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_currentIndex >= _questions.length) {
      return Scaffold(
        appBar: AppBar(title: Text("Quiz Result")),
        body: Center(
          child: Text(
            "Your Score: $_score / ${_questions.length}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    QuizQuestion current = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Question ${_currentIndex + 1} of ${_questions.length}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              current.question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            buildOption("1", current.opa),
            buildOption("2", current.opb),
            buildOption("3", current.opc),
            buildOption("4", current.opd),
          ],
        ),
      ),
    );
  }

  Widget buildOption(String number, String text) {
    bool isCorrect = number == _questions[_currentIndex].correctanswer;
    bool isSelected = number == _selected;

    Color? color;
    if (_answered) {
      if (isCorrect) {
        color = Colors.green;
      } else if (isSelected) {
        color = Colors.red;
      }
    }

    return GestureDetector(
      onTap: () => checkAnswer(number),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color ?? Colors.blue.shade50,
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}