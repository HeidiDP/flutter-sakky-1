import 'package:flutter/material.dart';
import 'package:monivalinta/data/questions.dart';
import 'package:monivalinta/question_screen.dart';
import 'package:monivalinta/start_screen.dart';
import 'package:monivalinta/results_screen.dart';

//yksityistä luokkaa voi käyttää vain  sen filen sisällä jossa se on
//yksityinen luokka _ luokan eteen, myös yksityisiä funktioita ja properteihin/metodeihin voi olla
//julkisella luokalla voi olla yksityisiä osia
//Widget
class Quiz extends StatefulWidget{
const Quiz({super.key});

@override
State<Quiz> createState() {
  return QuizState();
    
  }
}

//Widget State (statefulwidget vaatii kaksi luokkaa)
class QuizState extends State<Quiz>{

//ate Widget activeScreen; //null, tarvitaan ? datatyypin jälkeen->widget?, voi käyttää myös late widgetin edessä

//käytetään widgettien funktioita, joka suoritetaan kun objekti on luotu
// @override
//   void initState() { //koska initstate tapahtuu ennen build funktiota ei tarvita setstatea/initin sijainnilla ei väliä voi siirtää muuallekin
//     super.initState();
//     activeScreen =  StartScreen(switchScreen);
//   }
 List<String> selectedAnswers = [];
var activeScreen = 'start-screen';

//funktio
void switchScreen(){
  setState(
    () {  //suorittaa build funktion uudelleen jotta UI voi päivittyä
    //activeScreen = const QuestionScreen();-> tämä on versio 1:stä
    activeScreen = 'question-screen';
    },
  );
  
}
void chooseAnswer(String answer){
    selectedAnswers.add (answer);
// kun lisätään käyttäjän vastauksiin uusi vastaus, tarkistetaan onko kaikki vastaukset annettu
if(selectedAnswers.length == questions.length){
  setState(() {
   // selectedAnswers = [];  //tai selectedAnswers.clear();
    activeScreen = 'results-screen';
  });
  
  }
}

void restartQuiz(){
  
  setState((){
    selectedAnswers = [];  //tyhjennetään vastauslista kun painetaan nappia refresh quiz(result screen sivu)
    activeScreen = 'question:screen'; //palauttaa aloitussivun näkymän
  });

}

  @override

Widget build(context){

//tässä välissä voi suorittaa koodia, tässä ratkaistaan mitä sivua näytetään

Widget screenWidget = StartScreen(switchScreen); //tässä startscereen objekti käyttää switchscreen funktiota
//tämä switchscreen funktion toiminta on määritelty tällä sivulla jossa sitä käytetään

StartScreen((){});

if (activeScreen == 'question-screen') {
 screenWidget =  QuestionScreen(onSelectAnswer: chooseAnswer,);
} else if (activeScreen =='results-screen'){
  screenWidget = ResultsScreen(
    chosenAnswers: selectedAnswers,
    onRestart: restartQuiz,
    );
}

  return MaterialApp(
    home:Scaffold(
      
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors:[
            Colors.amberAccent, 
            Colors.cyan
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
          ),
        child: screenWidget
        // activeScreen == 'start-screen' 
        // ? StartScreen(switchScreen) //? true kohta //ternary expression, toimii kuin if else. vertaillaan 
        // : const QuestionScreen(), // : false kohta
      ),
    ),
  );
  }
}