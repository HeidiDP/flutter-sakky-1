import 'package:flutter/material.dart';

class QuestionDone extends StatelessWidget {
  const QuestionDone(this.onDone, {super.key});

  final void Function(int, BuildContext) onDone;

  @override
  Widget build(BuildContext context) {
    return  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           const Text('You have answered all questions, go see your results!',
            ),
            const SizedBox(height: 30),
            // map funktio käy läpi datan listassa, suorittaa funktion jokaista
            // listan itemiä kohden ja tallentaa uuden datan, uuteen listaan.
            // Uusi lista ei näy koodissa, se vain ilmestyy tähän kohtaan, jossa
            // suoritetaan map() funktio.
            ElevatedButton(
              onPressed:(){
                onDone(2, context);
              }, 
              child: const Text('Results!')),
            // map palauttaa listan, eli:
            // [widget, [widget, widget, widget], widget, widget jne]
            // lista ei kelpaa listaan widgettejä, joten se pitää purkaa
            // ... eli spread operaatio.
          ],
        );
  }
}