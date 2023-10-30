import 'package:flutter/material.dart';
import 'package:monivalinta_bugs/model/quiz_question.dart';

class QuestionNormal extends StatelessWidget {
  const QuestionNormal(this.currentQuestion, this.onAnswer, {super.key});

  final QuizQuestion currentQuestion;

  final void Function() onAnswer;

  @override
  Widget build(BuildContext context) {
    return  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
            ),
            const SizedBox(height: 30),
            // map funktio käy läpi datan listassa, suorittaa funktion jokaista
            // listan itemiä kohden ja tallentaa uuden datan, uuteen listaan.
            // Uusi lista ei näy koodissa, se vain ilmestyy tähän kohtaan, jossa
            // suoritetaan map() funktio.
            ...currentQuestion.shuffledAnswer.map(
              (item) {
                return AnswerButton(
                    answerText: item,
                    onTap: () {
                     onAnswer(item);
                      // muuta koodia
                    });
              },
            )
            // map palauttaa listan, eli:
            // [widget, [widget, widget, widget], widget, widget jne]
            // lista ei kelpaa listaan widgettejä, joten se pitää purkaa
            // ... eli spread operaatio.
          ],
        );
  }
}