import "package:flutter/material.dart";
import "./answer.dart";
import "./question.dart";
import "./raspuns.dart";

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
  final questions = const [
    {
      "questionText": "cul fav?",
      "answers": [
        "black",
        "red",
        "blu",
        "grin",
        "uait",
      ],
    },
    {
      "questionText": "animaurl fav?",
      "answers": [
        "epur",
        "cane",
        "miau",
        "oae",
        "mel",
      ],
    },
    {
      "questionText": "ultima antre bare?",
      "answers": [
        "sal",
        "kf",
        "binepa",
      ],
    }
  ];

  var _questionIndex = 0;
// setState() is a "trigger" that informs Flutter that it needs to re-run build() of the Widget.
  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < questions.length) {
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
        body: (_questionIndex < questions.length)
            ? Column(
                children: <Widget>[
                  //aici alege intrebarile, pe rand
                  Question(
                    questions[_questionIndex]["questionText"],
                  ),
                  //apoi alegi din raspunsuri
                  //map aplica o functie (aici anonima) pe fiece raspuns
                  //so, fiece raspuns e trecut prin widgetul Answer
                  // pui as List<x> altfel nu mere map-ul
                  ...(questions[_questionIndex]["answers"] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(), //converts all to list
                  //map nu schimba lista originala, creeaza alta

                  // ... spread operator takes a list and pull all the values out of it,
                  // and add them to the surounding list as individual values
                  //  (so that we don't add a list to a list, but the values of a list to a list)
                  // aka no more nested lists, we will only have one list
                ],
              )

//ternary ELSE ( ":" )
//nu mai iei eroare dupa ce epuizezi intrebarile, ci iti afiseaza textul asta
            : Center(
                child: Text("y did it"),
              ),
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
