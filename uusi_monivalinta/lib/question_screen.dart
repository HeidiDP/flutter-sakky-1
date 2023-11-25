import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uusi_monivalinta/data/questions.dart';
import 'package:uusi_monivalinta/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
   return  _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currrentQuestionIndex = 0;

void answerQuestion(String selectedAnswer){
  widget.onSelectAnswer(selectedAnswer);
  setState(() {
    currrentQuestionIndex++;
  });
}

  @override
  Widget build(context) {
    final currentQuestion = questions[currrentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.quantico(color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox( height: 30,
            ),

            ...currentQuestion.shuffledAnswers.map((item){
              return AnswerButton(
                answerText: item,
                onTap: (){answerQuestion(item);}
              );
            },)
          ],
        ),
      ),
    );
  }
}