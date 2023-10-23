import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
    {super.key, required this.isCorrectAnswer, required this.questionIndex});

  final int questionIndex;
  final bool isCorrectAnswer; //määrittää taustavärin

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration:  BoxDecoration(
        color:isCorrectAnswer == true ? Colors.green : Colors.red, //tässä on ternary operaatio, jos vastaus on oikein =vihreä ja : tark että sen jälkeen tulee false=pun
         borderRadius: BorderRadius.circular(100)),
      child: Text(questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
         ),
        ),
    );
  }
}