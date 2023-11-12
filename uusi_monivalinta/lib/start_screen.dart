import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
       
      const SizedBox(
      height: 60,
        ),

       const  Text('Start screen',
          style: TextStyle(
          color: Color.fromARGB(255, 98, 238, 4),
          fontSize: 28,
            ),
          ),
      const SizedBox(
        height: 50,
          ),
        OutlinedButton.icon(
          onPressed: startQuiz, // ALOIT
          style:OutlinedButton.styleFrom(
            foregroundColor:const Color.fromARGB(255, 98, 238, 4),
           ),
           icon: const Icon(Icons.adb),
           label: const Text('Start Quiz'),
           ),
      
        ],
      ),
    );
   
  }
}