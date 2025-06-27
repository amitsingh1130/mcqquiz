import 'dart:convert';

import 'package:http/http.dart' as http;

class Utilities {
  static String currentquizname = "";
  static String currentquizurl = "";
static String currentquizoption = "";
  //Created by Amit
  static List questions = [];



  static Future<void> loadQuestions() async {
    print(Utilities.currentquizurl);
    final response = await http.get(Uri.parse(Utilities.currentquizurl));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      Utilities.questions = data;

      // widget.questionno++;
      //print(data);
      // widget.question = Utilities.questions[widget.questionno]["question"];
      // setState(() {});

    }

  }
}
