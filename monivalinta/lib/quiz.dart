import 'package:flutter/material.dart';
import 'package:monivalinta/start_screen.dart';
//Widget
class Quiz extends StatefulWidget{
const Quiz({super.key});

@override
State<Quiz> createState() {
  return QuizState()
    
  }
}

//Widget State (statefulwidget vaatii kaksi luokkaa)
class QuizState extends State<Quiz>{
  @override
Widget build(context){
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
        child: const StartScreen(),
      ),
    ),
  );
  }
}