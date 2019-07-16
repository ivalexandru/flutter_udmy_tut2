import "package:flutter/material.dart";

//cu acest widget poti sa inlocuiesti Text() widget-ul
//pt ca in constructor ai o valoare pe care o returnezi apoi
class Question extends StatelessWidget {
  final String questionText;
  // e bine sa pui final pt ca oricum nu vei schimba asta, 
  // iar daca s-ar schimba ar fi de rau
  // valoarea x nu se va schimba DUPA initializarea din constructor
  //in constructor se schimba ca pe acolo accepti valoarea 

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(questionText,  
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
      ),
    );
  }
}
// .infinity means the container gets as much width as it can get

// MULTIPLE CONSTRUCTORS
// EdgeInsets.all => edgeInsets are mai multi constructori posibili
// folositor pt a instantia cu setari diferite