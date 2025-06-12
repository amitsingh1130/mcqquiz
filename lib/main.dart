import 'package:flutter/material.dart';
import 'question.dart';
void main() {
  runApp(VSJQuizApp());
}

class VSJQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Card(
                child: Text(
                  "Quiz App",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.grey.shade900,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: VSJQuiz(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VSJQuiz extends StatefulWidget {
  @override
  VSJQuizState createState() => VSJQuizState();
}

class VSJQuizState extends State<VSJQuiz> {
  String currentquestiontext = "Press any button to start the quiz";
  String optatext = "", optbtext = "", optctext = "", optdtext = "";
  List<Widget> scores = [];
  int questionno = -1;
  int _selectedOption = 0;
  bool istestover = false;
  Question? currentquestion;
  List<Question> questions = Utilities.getQuestions();

  void nextQuestion(int answer) {
    if (istestover) {
      SnackBar bar = Utilities.getSnackBar("Test Over");
      ScaffoldMessenger.of(context).showSnackBar(bar);
      return;
    }
    if (questionno == -1) {
      questionno++;
      currentquestion = questions[questionno];
      currentquestiontext = currentquestion!.question;
      optatext = currentquestion!.opta;
      optbtext = currentquestion!.optb;
      optctext = currentquestion!.optc;
      optdtext = currentquestion!.optd;
      setState(() {});
      return;
    }
    if (answer == 0) {
      SnackBar bar = Utilities.getSnackBar("Please select an option");
      ScaffoldMessenger.of(context).showSnackBar(bar);

      return;
    }
    int n = questions.length;
    addResult(answer);
    questionno++;
    if (questionno >= n) {
      istestover = true;
      currentquestiontext = "Test over";
      optatext = "";
      optbtext = "";
      optctext = "";
      optdtext = "";
      setState(() {});
      return;
    }
    currentquestion = questions[questionno];
    currentquestiontext = currentquestion!.question;
    optatext = currentquestion!.opta;
    optbtext = currentquestion!.optb;
    optctext = currentquestion!.optc;
    optdtext = currentquestion!.optd;
    setState(() {});
  }

  void addResult(int answer) {
    bool iscorrect = answer == currentquestion!.correctanswer;

    if (iscorrect) {
      scores.add(const Icon(Icons.check, color: Colors.green));
    } else {
      scores.add(const Icon(Icons.close, color: Colors.red));
    }
  }

  void _handleOptionChange(int? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentquestiontext,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        if (!istestover && questionno >= 0)
          Expanded(
            flex: 5,
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3.0,
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      optatext,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                    value: 1,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title: Text(
                      optbtext,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                    value: 2,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title: Text(
                      optctext,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                    value: 3,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title: Text(
                      optdtext,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                    value: 4,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                ],
              ),
            ),
          )
        else
          const Expanded(flex: 5, child: Text("")),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                print("Submitted $_selectedOption");
                nextQuestion(_selectedOption);
                _selectedOption = 0;
                setState(() {});
              },
            ),
          ),
        ),
        Row(children: scores),
      ],
    );
  }
}

//********************************************************************
