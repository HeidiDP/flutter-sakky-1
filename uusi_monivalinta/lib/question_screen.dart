import 'package:flutter/material.dart';
import 'package:uusi_monivalinta/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
   return  _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currrentQuestionIndex = 0;

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex]

    return Container(
      margin: const EdgeInsets.all(40),
      child: const Center(
        child: Column(
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
            ),
            SizedBox( height: 30,
            )
          ],
        ),
      ),
    );
  }
}