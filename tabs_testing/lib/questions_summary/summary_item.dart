import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabs_testing/questions_summary/questions_identifier.dart';

//tässä tiedostossa on yksi rivi tuloksia, käytetään question_identifier widgettiä
//sarakkeessa kysymys, vastaus ja oikea vastaus

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData,
      {super.key}); //sijaintiparametrit tulee olla key vasemmalla puolella, nimetyt voi olla oikealla

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
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
                style: GoogleFonts.lato(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['user_answer'] as String,
                style: TextStyle(
                  color:isCorrectAnswer == true ? const Color.fromARGB(255, 14, 33, 204) : const  Color.fromARGB(255, 121, 2, 2),
                ),
              ),
              Text(
                itemData['correct_answer'] as String,
                style:  TextStyle(
                  color: isCorrectAnswer == true ? const Color.fromARGB(255,14, 13, 204) : const Color.fromARGB(255, 9, 116, 13),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
