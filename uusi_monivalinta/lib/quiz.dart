import 'package:flutter/material.dart';
import 'package:uusi_monivalinta/start_screen.dart';
import 'package:uusi_monivalinta/data/questions.dart';
import 'package:uusi_monivalinta/question_screen.dart';


//statefulwidgetissä kaksi luokkaa (statea), vaihdettiin yksityinen luokka julkiseksi
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  //1. luokka state
  State<Quiz> createState() {
    return QuizState();

    }
}
//2. luokka state
class QuizState extends State<Quiz> {

  List<String> selectedAnswer =[];
  var activeScreen = 'start-screen';

//funktio
  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
     },
    );
  }
  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if( selectedAnswer.length ==  questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }
  //TÄSTÄ VÄLISTÄ PUUTTUU VIELÄ RESTARTQUIZ FUNKTIO

  @override
  Widget build(context) {

//tässä alla haetaan startscreen  objekti? jossa funktio? 
////ja tallennetaan se screenwidgetiin
    Widget screenWidget = StartScreen(switchScreen);

    StartScreen(() {});

    if(activeScreen == 'question-screen'){
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer,);
    } else if (activeScreen = 'results-screen'){
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    //Tee aluksi materialapp
    return   MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Colors.pink,
              Colors.yellow,
            ],
            )
          ),
          //KÄYTETÄÄN STARTSCREEN WIDGETTIÄ TÄSSÄ? joka on laitettu tällä sivulla 
          //screenWidgettiin?
          child: screenWidget,

        ),
      ),
    );
  }
}