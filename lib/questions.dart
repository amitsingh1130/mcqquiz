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