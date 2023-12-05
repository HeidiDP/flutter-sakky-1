import 'package:flutter/material.dart'; //tarvitaan että löytää esim tuon Color parametrin tänne

//tässä luodaan enumenaattori categories, käytetään mm categories filessä mappina
enum Categories {
  vegetables,
  fruit,
  nomeat,
  nodairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}
//luodaan Category luokka kuten filen nimi on
class Category{
  // esim. this.title on sijaintiparametri ja se on pakollinen/ required this... on taas nimetty parametri
  const Category( this.title, this.color);

  final String title;
  final Color color;
}