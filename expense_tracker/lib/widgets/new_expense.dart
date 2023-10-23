import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

//var _enteredTitle = '';

//void _saveTitleInput(String inputValue){
  //funktio joka ottaa talteen title datan syötetystä tekstistä teksti fieldissä
  //_enteredTitle = inputValue;  //käyttäjän syöttämä teksti(inöputvalue)meneee enteredTitle muuttujaan
//}

//flutteri objekti, suorittaa käyttäjän syöttämän tekstin tallennuksen
final _titleController = TextEditingController();
final _priceController = TextEditingController();

void _presentDatePicker(){
  final now = DateTime.now();
  final firstDate = DateTime(now.year - 1, now.month, now.day);
  
  showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);
}

@override
  void dispose() {
    //osa widgertin elämänkaarta suoritetaan kun widget poistuu käytöstä
    // TODO: implement dispose
    _titleController.dispose();
    _priceController.dispose(); //tämä on nyt texteditingcontrollerille tarkoitettu(muutkin controllerit tarvii tämän)
    super.dispose(); //jos ei poisteta "dispoussata" niin voi aihetttuu muistivuotoa ja ohjelma kaatuu
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16), //joka suuntaan paddingia
      child: Column(
        children: [
        TextField( //teksti kenttä johon voi syöttää tekstinä uuden kulun
          controller: _titleController, 
          maxLength: 50,
         // keyboardType: TextInputType.text,
         decoration: const InputDecoration(
          label: Text('title'),
          ),
         ),

         Row(
           children: [
             Expanded(
               child: TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const  InputDecoration(
                  prefixText: '€',  //jos haluat dollarin kuvan niin escapetetaa dollarin merkki /$
                  label: Text('price'),
                ),
               ),
             ),
             const SizedBox(
              width: 16,
             ),
             Expanded(
               child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const Text('Selected Date'),
                IconButton(
                  onPressed: _presentDatePicker, 
                  icon:const Icon(Icons.calendar_month))
               ],
               ),
             )
           ],
         ),
         Row(
          children: [
            ElevatedButton(onPressed: (){
              print(_titleController.text);
              print (_priceController.text);
            }, child: const Text('Save Expense')),
            TextButton(onPressed: (){
              Navigator.pop(context);
            },
            style:TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            backgroundColor: Colors.red),
             child: const  Text('cancel')
            ),
          ],
         )
        ],
      ),
    );
  }
}