import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
  const QuestionIdentifier({super.key, required this.questionIndex, required this.isCorrectAnswer});
  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  
  Widget build(BuildContext context){
    final questionNumber = questionIndex + 1;
    
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //alla ternary operaatio, jos vastaus oikein väri on vihreä ja jos väärä niin punainen
        color: isCorrectAnswer == true ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(questionNumber.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}