import 'package:flutter/material.dart';
import 'package:uusi_monivalinta/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers; //lista valituista vastauksista
  final void Function() onRestart;

List<Map<String, Object>> get summaryData{
 final  List<Map<String, Object>> summary = [];

for (var i = 0; i < chosenAnswers.length; i++){
  summary.add({
    'question_index' : i,
    'question' : questions[i].text,
    'correct_answer':questions[i].answers[0],
    'user_answer':chosenAnswers[i]
  });
}
return summary;

 }


  @override
  Widget build(BuildContext context) {
//muuttujat joissa kysymysten lukumäärä ja oik vastausten määrä
final numTotalQuestions = questions.length;
final numCorrectquestions = summaryData.where(
(elementData) =>elementData['user_answer'] == elementData['correct_answer'],
);

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(children: [
          Text('you answered ${numCorrectquestions.length} out of $numTotalQuestions questions correctly!'),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(
            summaryData,
          ),

          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black87,
            ),
            onPressed: onRestart,
            icon: const Icon(Icons.refresh), 
            label: const Text('Restart Quiz!'),
            )
        ]),
      ),
    );
  }
}