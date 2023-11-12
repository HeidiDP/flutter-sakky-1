import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
   return  _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(context) {

    return Container(
      margin: const EdgeInsets.all(40),
      child: const Center(
        child: Column(
          children: [
            Text('Heippa'),
          ],
        ),
      ),
    );
  }
}