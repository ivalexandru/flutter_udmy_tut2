//de aici va alege text_control

import 'package:flutter/material.dart';

class Textul extends StatelessWidget {
  String textul;
  Textul(this.textul);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(textul),
    );
  }
}
