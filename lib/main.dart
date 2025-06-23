import 'package:flutter/material.dart';
import 'vsjone.dart';
import 'vsjtwo.dart';
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => VsjOne(), '/second': (context) => VsjTwo()},
    ),
  );
}
