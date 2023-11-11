import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
       
      const SizedBox(
      height: 60,
        ),

       const  Text('Start screen',
          style: TextStyle(
          color: Colors.blue,
          fontSize: 28,
            ),
          ),
      const SizedBox(
        height: 50,
          ),
        OutlinedButton.icon(
          onPressed: startQuiz, //TÄHÄN TULEE STARTQUIZ KUNHAN SE ON TEHTY
          style:OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
           ),
           icon: const Icon(Icons.adb),
           label: const Text('Start Quiz'),
           ),
      
        ],
      ),
    );
   
  }
}