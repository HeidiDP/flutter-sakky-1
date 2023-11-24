import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget{
  const SummaryItem({super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context){
    final isCorrectAnswer = 
    itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['user_answer'] as String,
                style: TextStyle(
                  color: isCorrectAnswer == true ? const Color.fromARGB(255, 14, 33, 204) : const Color.fromARGB(255, 121, 2, 2),

                ),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: TextStyle(
                  color: isCorrectAnswer == true ? const Color.fromARGB(255, 14, 13, 204) : const Color.fromARGB(255, 9, 116, 13),   
                ),
              ),
            ],
          ),
          )
      ],
    );
  }
}