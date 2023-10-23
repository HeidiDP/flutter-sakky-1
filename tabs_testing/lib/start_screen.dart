import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget{
  //constructori on samanniminen kuin luokka
const StartScreen(this.startQuiz, {super.key});//funktion pointteri on tässä

//luokkamuuttua/property
final void Function() startQuiz; //tämä on kytkettynä yllä olevaan this.startQi

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // mainaxissize on tilaratkaisu, eli voit valita viekö minimin vai max tilaa
        children: [
          // Opacity(
          //   opacity: 0.55,
          //   child: Image.asset('assets/images/question.png',
          //    width: 200),
          // ),
          Image.asset('assets/images/question.png',
             width: 200,
             //color: Colors.yellowAccent jos haluat vaihtaa väriä kuvaan
             ),
          
           const  SizedBox(
            height: 60,
           ),

            const Text('Start screen', 
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight:FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
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