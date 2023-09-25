import 'package:flutter/material.dart';
import 'package:monivalinta/question_screen.dart';
import 'package:monivalinta/start_screen.dart';
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

  @override
Widget build(context){

//tässä välissä voi suorittaa koodia, tässä ratkaistaan mitä sivua näytetään

Widget screenWidget = StartScreen(switchScreen);

if (activeScreen == 'question-screen') {
 screenWidget = const QuestionScreen();
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