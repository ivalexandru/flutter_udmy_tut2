import "package:flutter/material.dart";

import "./text_control.dart";

//create project, output AppBar with some text below

//add button to change text

//split the app in 3 widgets: App, TextControl, Text

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("sal"),
      ),
      body: TextControl(),
    ));
  }
}
