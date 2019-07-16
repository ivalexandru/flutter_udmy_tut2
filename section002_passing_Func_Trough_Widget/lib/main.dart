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
  var _questionIndex = 0;
// setState() is a "trigger" that informs Flutter that it needs to re-run build() of the Widget.
  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print("answer chosen");
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["sa`l kfky?", "animaurl?"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("titlul"),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Raspuns(_answerQuestion),
          ],
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
