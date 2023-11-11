import 'package:flutter/material.dart';
import 'package:uusi_monivalinta/start_screen.dart';

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

  var activeScreen = 'start-screen';
  
  @override
  Widget build(BuildContext context) {
    //aloitetaan materialapin rakentamisella
    return   MaterialApp(
      home: Scaffold(
        body: Container(

        ),
      ),
    );
  }
}