import "package:flutter/material.dart";

class Raspuns extends StatelessWidget {
  final Function preiaFunctia;

  Raspuns(this.preiaFunctia);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.deepPurple,
        onPressed: preiaFunctia,
        child: Text("ce butonu` meu te uiti?"),
      ),
    );
  }
}
