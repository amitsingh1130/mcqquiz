
import 'package:flutter/material.dart';


class McqQuiz extends StatefulWidget {
@override
McqQuizState createState() => McqQuizState();
}

class McqQuizState extends State<McqQuiz> {


@override
Widget build(BuildContext context) {
return Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.stretch,
children: <Widget>[
Expanded(
child: Center(
child: Image(
image: NetworkImage(
"  https://www.canva.com/templates/EAFD8J7HWeE/",
),
),),),
SizedBox(height: 20),



],
);
}
}