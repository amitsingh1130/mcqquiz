import 'package:flutter/material.dart';

class Question {
  String question, opta, optb, optc, optd;
  int correctanswer;
  Question(
    this.question,
    this.opta,
    this.optb,
    this.optc,
    this.optd,
    this.correctanswer,
  );
}

class Utilities {
  static List<Question> getQuestions() {
    List<Question> questions = [
      Question(
        "Which programming language is used to develop apps in Flutter?",
        "Kotlin",
        "Dart",
        "Swift",
        "Java",
        2,
      ),
      Question(
        "In Flutter, what widget is used for layout in a vertical direction?",
        "Row",
        "Stack",
        "Column",
        "Expanded",
        3,
      ),
      Question(
        " Which command creates a new Flutter project from the terminal?",
        "flutter create_project my_app",
        "flutter run my_app",
        "flutter create my_app",
        "flutter init my_app",
        3,
      ),
      Question(" What is the use of the Scaffold widget in Flutter?",
          "For managing screen transitions",
          "For creating lists",
          "For dependency injection",
          "For defining app structure like AppBar, Drawer, Body, etc.",
          4),
      Question(
        "Which is the capital of japan",
        "Hukulganj",
        "Tokyo",
        "Lucknow",
        "China",
        2,
      ),
      Question(
        "Which is the Capital of China",
        "US",
        "UK",
        "Chandigarh",
        "Beijing",
        4,
      ),
      Question(
        "Which is The capital of India",
        "Delhi",
        "Bangluru",
        "Patna",
        "Asam",
        1,
      ),
      Question(
        "Which is The Capital of United Kingdom",
        "Virginia",
        "London",
        "Washington",
        "Canada",
        2,
      ),
    ];

    return questions;
  }

  static SnackBar getSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    return snackBar;
  }
}

//****************************************************************
