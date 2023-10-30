// Luo stateful widget, joka palauttaa Text widgetin tekstillä "Question Screen"

import 'package:flutter/material.dart';

import 'package:monivalinta_bugs/answer_button.dart';
import 'package:monivalinta_bugs/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer, this.currentIndex, required this.onDone});

  final void Function(String answer, int tabIndex, BuildContext ctx) onSelectAnswer;
  final void Function( int, BuildContext) onDone;

  final int currentIndex;

  // createState
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

// Luokan nimessä on alaviiva, joten se on yksityinen
// Yksityistä luokkaa voi käyttää vain tämän tiedoston sisäiset koodit
class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer, 2, context );
    //currentQuestionIndex = currentQuesti,onIndex + 1;
    //currentQuestionIndex += 1;
    setState(() {
      //currentQuestionIndex++;
    });
  }

  // build
  @override
  Widget build(context) {
    Widget viewWidget = QuestionDone(onDone: widget.onDone);
    if(widget.currentIndex < questions.length){
      final currentQuestion = questions[widget.currentIndex];
      viewWidget = QuestionNormal(currentQuestion, answerQuestion);
    }else{}
    

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: viewWidget
        
      ),
    );
    // 1. otetaan koko sivu käyttöön. lisää siihen tarkoitukseen oikea widget
    // 2. sisältö on keskellä ruutua x ja y suunnassa. siihen widget ja asetukset
    // 3. teksti, johon tulee sitten kysymys
    // 4. OutlinedButton x 4, joissa valitaan oikea vastaus
  }
}
