import "package:flutter/material.dart";

import "./quiz.dart";
import "result.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}
//State will be persistent(ce e mai jos de aici)
// Whilst you can add (and also change) properties in a StatelessWidget,
// there's no way of telling Flutter that it should re-run build() upon such changes.

//PRIVATE properties
// _MyAppState, pt ca vrei ca _MyAppState sa poata fi ACCESAT/modificat doar de aici, de catre MyApp

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  var _totalScore = 0;
  var _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

// setState() is a "trigger" that informs Flutter that it needs to re-run build() of the Widget.
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
      print("we've more ques");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("titlul"),
        ),
//ternary IF ( "?" ) true:
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
//ternary ELSE ( ":" )
//nu mai iei eroare dupa ce epuizezi intrebarile, ci iti afiseaza textul asta
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

//We can use the private method only from a class instance which got this method as one of the passed parameters.
// If you would try to call the method without this explicit permisson you would not succeed.

//LIFT THE STATE UP
//u manage the state on the common denominator of the different widgets
// that need this state (adica le 'aduci' pe toate in main cu import)
// si aici manage state

// [] means a list

// Scaffold creates a basic design and color scheme;
// also has named arguments available with ctrl + space

//app state = is the user auth; the overall jobs loaded;
// widget state = current user input; do we wanna show clepsidra cand se incarca chestii

// nput data" in flutter describes the data that is passed
// into a Widget through its constructor.
