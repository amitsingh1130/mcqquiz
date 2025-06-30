import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MultiQuizApp());
}

class MultiQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuizListPage(),
    );
  }
}

class QuizUtilities {
  static List<dynamic> quizData = [];
  static int currentQuestionIndex = 0;
  static int score = 0;
  static bool quizCompleted = false;
  static String feedback = '';

  /// Download Quiz Data from URL
  static Future<void> downloadQuizData(String quizUrl) async {
    try {
      final response = await http.get(Uri.parse(quizUrl));
      if (response.statusCode == 200) {
        quizData = jsonDecode(response.body);
        currentQuestionIndex = 0;
        score = 0;
        quizCompleted = false;
        feedback = '';
      } else {
        throw Exception('Failed to load quiz');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  /// Get Current Question
  static Map<String, dynamic> getCurrentQuestion() {
    return quizData[currentQuestionIndex];
  }

  /// Check Answer
  static void checkAnswer(int selected, VoidCallback onNext) {
    String correct = quizData[currentQuestionIndex]['correctanswer'];
    if (selected.toString() == correct) {
      score++;
      feedback = "✅ Correct!";
    } else {
      feedback = "❌ Wrong!";
    }

    Future.delayed(Duration(seconds: 1), () {
      feedback = '';
      if (currentQuestionIndex < quizData.length - 1) {
        currentQuestionIndex++;
      } else {
        quizCompleted = true;
      }
      onNext();
    });
  }

  /// Reset Quiz
  static void resetQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    quizCompleted = false;
    feedback = '';
  }
}

class QuizListPage extends StatefulWidget {
  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  final String quizListUrl =
      'https://amitsingh1130.github.io/myjsonfiles/Quiz.json';
  List<dynamic> quizList = [];
  bool loading = true;
  bool error = false;

  @override
  void initState() {
    super.initState();
    fetchQuizList();
  }

  Future<void> fetchQuizList() async {
    try {
      final response = await http.get(Uri.parse(quizListUrl));
      if (response.statusCode == 200) {
        setState(() {
          quizList = jsonDecode(response.body);
          loading = false;
        });
      } else {
        setState(() => error = true);
      }
    } catch (e) {
      setState(() => error = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(appBar: AppBar(title: Text('Loading...')), body: Center(child: CircularProgressIndicator()));
    }

    if (error) {
      return Scaffold(appBar: AppBar(title: Text('Error')), body: Center(child: Text('Failed to load quizzes')));
    }

    return Scaffold(

      appBar: AppBar(title: Text('Select Quiz',style: TextStyle(fontSize: 30,color: Colors.black,backgroundColor: Colors.indigoAccent)),centerTitle: true),
      body: ListView.builder(
        itemCount: quizList.length,
        itemBuilder: (context, index) {
          var quiz = quizList[index];
          return Center(
            child: SizedBox(width: 400,height: 60,
              child: ListTile(
                title: Text('Quiz ${quiz['quizno']}: ${quiz['quizname']}',style: TextStyle(color: Colors.black,backgroundColor: Colors.yellowAccent,fontSize: 30),),
                trailing: Icon(Icons.arrow_forward),
                onTap: () async {
                  try {
                    await QuizUtilities.downloadQuizData(quiz['url']);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage(quizName: quiz['quizname'])));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to load quiz')));
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String quizName;
  QuizPage({required this.quizName});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void nextQuestion() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (QuizUtilities.quizCompleted) {
      return Scaffold(
        appBar: AppBar(title: Text('${widget.quizName} - Completed')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Score: ${QuizUtilities.score} / ${QuizUtilities.quizData.length}', style: TextStyle(fontSize: 24)),
              SizedBox(height: 50),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () {
                    QuizUtilities.resetQuiz();
                    setState(() {});
                  },
                  child: Text('Restart Quiz',style: TextStyle(fontSize: 20,color: Colors.black),)),
              SizedBox(height: 10),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back to Quiz List',style: TextStyle(fontSize: 20,color: Colors.black),)),
            ],
          ),
        ),
      );
    }

    var q = QuizUtilities.getCurrentQuestion();

    return Scaffold(
      appBar: AppBar(title: Text(widget.quizName,style: TextStyle(backgroundColor: Colors.lightGreenAccent,fontSize: 50),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Q${q['qno']}: ${q['question']}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,backgroundColor: Colors.lightBlueAccent,color: Colors.black)),
            SizedBox(height: 150),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                onPressed: () => QuizUtilities.checkAnswer(1, nextQuestion), child: Text(q['opa'],style: TextStyle(fontSize: 28,color: Colors.black),)),
            SizedBox(height: 10),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                onPressed: () => QuizUtilities.checkAnswer(2, nextQuestion), child: Text(q['opb'],style: TextStyle(fontSize: 28,color: Colors.black),)),
            SizedBox(height: 10),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors. teal),
                onPressed: () => QuizUtilities.checkAnswer(3, nextQuestion), child: Text(q['opc'],style: TextStyle(fontSize:28,color: Colors.black),)),
            SizedBox(height: 10),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors. indigo),
                onPressed: () => QuizUtilities.checkAnswer(4, nextQuestion), child: Text(q['opd'],style: TextStyle(fontSize:28,color: Colors.black),)),
            SizedBox(height: 10),
            if (QuizUtilities.feedback.isNotEmpty)
              Text(QuizUtilities.feedback, style: TextStyle(fontSize: 18, color: Colors.blue,backgroundColor: Colors.cyan)),
          ],
        ),
      ),
    );
  }
}