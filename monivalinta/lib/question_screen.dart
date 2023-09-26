import 'package:flutter/material.dart';
import 'package:monivalinta/answer_button.dart';
import 'package:monivalinta/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState(); //tässä palautetaan objekti alla olevasta private luokasta
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  //alaviiva luokan edessä tarkoittaa private luokkaa, ei voi käyttää muualla kuin tässä

var currrentQuestionIndex = 0;

void answerQuestion(String selectedAnswer){
  widget.onSelectAnswer('answer');
  
  setState(() {
    //eli aina alkuun ennen suoritusta tulee 0 ja sen jälkeen suoritetaan joten lisätään  1 joka suoritukselle
  //tai ++ tai +=1-> alla on käytetty tuota ++ toimintoa
    currrentQuestionIndex++;
  });
}

  @override
  Widget build(context) {
    final currentQuestion = questions[currrentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),  //tässä muuotoillaan nappeja niin että ne on yhtä leveät mutta reunoille jää tilaa
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style:GoogleFonts.quantico(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
    
            //alla on kolme pistettä, spread operaatio->purkaa listan widgettejä ->kaikki mitä sieltä löytyy
            ...currentQuestion.getShuffledAnswers().map((item) {      //map funktio käy läpi datan listasta jokaisen listan string tekstin(data/question.dart sivun tekstin)
              return AnswerButton(
                answerText: item,
                onTap: (){answerQuestion(item);});
            },)
    
            
           
          ],
        ),
      ),
    );
  }
}
