import "package:flutter/material.dart";
import "./question.dart";

class Answer extends StatelessWidget {
  final Function selectHandler;
  // in selectHandler e storat _answerQuestion din main;
  // mai exact de aici Answer(_answerQuestion),
  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text("answer1"),
        onPressed: selectHandler,
      ),
    );
  }
}
