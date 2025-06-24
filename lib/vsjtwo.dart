import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'classutilities.dart';

class VsjTwo extends StatefulWidget {
  _VsjTwo createState() {
    return _VsjTwo();
  }
}

class _VsjTwo extends State<VsjTwo> with SingleTickerProviderStateMixin {
  String data = "";

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text(Utilities.currentquizname)),
      body: Column(children: []),
    );
  }

  @override
  Future<void> loadQuestions() async {
    print(Utilities.currentquizurl);
    final response = await http.get(Uri.parse(Utilities.currentquizurl));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      print(data);
    }
  }
}
