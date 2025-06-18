import 'package:flutter/material.dart';
import 'utilities.dart';
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
                "https://amitsingh1130.github.io/pics_videos_audio/pic.jpg",
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
