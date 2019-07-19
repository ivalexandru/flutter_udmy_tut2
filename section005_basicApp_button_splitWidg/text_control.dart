import 'package:flutter/material.dart';
import "./text_output.dart";

class TextControl extends StatefulWidget {
  @override
  _TextControlState createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _mainText = "pe tine te schimb";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("Change text "),
          onPressed: () {
            setState(() {
              _mainText = "this changed";
            });
          },
        ),
        Textul(_mainText),
      ],
    );
  }
}
