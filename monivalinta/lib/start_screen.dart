import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartScreen extends StatelessWidget{
const StartScreen({super.key});//constructori on samanniminen kuin luokka

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
            onPressed: (){},
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