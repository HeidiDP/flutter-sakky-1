import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical:10, horizontal: 40 ),
        backgroundColor: const Color.fromARGB(230, 134, 255, 209),
        foregroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )),
        child: Text(answerText, textAlign: TextAlign.center,
         ),
      );
  }
}