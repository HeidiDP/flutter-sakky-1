import 'package:flutter/material.dart';
import 'package:monivalinta/data/questions.dart';
import 'package:monivalinta/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});

   final List<String> chosenAnswers;
   final void Function() onRestart;

   //List<Map<String, Object>> getSummaryData(){        tässä on toinen vaihtoehto, joko 11 tai 12 rivi
    List<Map<String, Object>> get summaryData{
    final List<Map<String, Object>> summary = [];

for (var i = 0; i < chosenAnswers.length; i++) {
summary.add({
  'question_index': i,
  'question': questions[i].text,
  'correct_answer': questions[i].answers[0],
  'user_answer':chosenAnswers[i]
});

}
    return summary;
   }

  @override
  Widget build(BuildContext context) {
//luodaan muuttujat jossan onkaikkien kysymysten lukumäärä ja oikeiden vastausten lukumäärä
    //final summaryData =  getSummaryData();  tässä on kommentoitu koska jos käytät rivin 11 komentoa niin tarvitset tämän koodin rivillä 30
    final numTotalQuestions = questions.length;
    final numCorrectquestions = summaryData.where(
        //where funktio sisällä pitää suorittaa funktio joka palauttaa true tai false(vertailuoperaatio)
         (elementData) => elementData['user_answer'] == elementData['correct_answer'],  //tässä tulee vastaus näytölle montako kysymystä oli oikein
    );
  
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                onPressed: onRestart, //funktion pointteri tulee tähän
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'),
           ),
          ],
        ),
      )
    );
    
   
  }
}