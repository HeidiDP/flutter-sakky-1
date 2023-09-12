import 'package:flutter/material.dart';

/* koodi rakentuu kahdesta erilaisista "sanoista"
1. keywords, ohjelmointikieli määrittelee(siniset on keywordeja)
2. identifiers, ohjelmoijat määrittelee(keltaiset on identifiereitä, luokat eli vihreät on myös näitä)
*/
void main() {
  //määritellään funktio, "main" on dart kielen aloituspiste

  // funktion body
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Heippa maailma!'), // pilkut sulkujen jälkeen ja shift+ alt +F niin jäsentelee tuon nätimmin
        ),
      ),
    ),
  ); // suoritetaan flutter frameworkin funktio
} // const, data on immmutable eli muuttumaton /scaffold tekee visuaalisesta näkymästä paremman

void add({num1, num2}) {
  //määritellään nimettyjä parametreja
  num1 + num2;
}

void test() {
  add(num1: 5, num2: 3); // suoritetaan, käytetään named parameters
}
