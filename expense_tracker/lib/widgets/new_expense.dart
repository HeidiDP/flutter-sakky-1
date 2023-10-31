import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

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
  DateTime?
      _selectedDate; //? tarkoittaa että muuttuja arvo voi olla null,sovellus ei kaadu
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    //valittu päivämäärä otetaan väliaikaiseen muuuttujaan alla ja
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    //funktio jossa tarkistetaan käyttäjän syöttämä data title ja hinta, pvm

    final double? enteredPrice = double.tryParse(_priceController.text);

// == <= <: ovat vertailuoperaatioita.  || ja && loogisia operaatioita joilla voi yhdistää useamman vertailun
    final bool priceIsInvalid = enteredPrice == null ||
        enteredPrice <
            0; //tarkistaa vertailulla onko syötetty hinta null tai onko yli 0

    if (_titleController.text.trim().isEmpty ||
        priceIsInvalid == true ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure information is entered correctly!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Ok'))
                ],
              ));
      return; //päättää funktion suorituksen
    }
    //luodaan uusi expense objekti
  final temp = Expense(title: _titleController.text, amount: enteredPrice!, date: _selectedDate! , category: _selectedCategory);
    //lähetetään objekti funktion parametrinä
    widget.onAddExpense(temp);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    //osa widgertin elämänkaarta suoritetaan kun widget poistuu käytöstä
    // TODO: implement dispose
    _titleController.dispose();
    _priceController
        .dispose(); //tämä on nyt texteditingcontrollerille tarkoitettu(muutkin controllerit tarvii tämän)
    super
        .dispose(); //jos ei poisteta "dispoussata" niin voi aihetttuu muistivuotoa ja ohjelma kaatuu
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16), //joka suuntaan paddingia
      child: Column(
        children: [
          TextField(
            //teksti kenttä johon voi syöttää tekstinä uuden kulun
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
                  decoration: const InputDecoration(
                    prefixText:
                        '€', //jos haluat dollarin kuvan niin escapetetaa dollarin merkki /$
                    label: Text('price'),
                  
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //ternary operaatio, ensin vertaillaan true tai false onko null vai ei/ ? jos totta niin tehdään, : jos false
                    Text(_selectedDate == null
                        ? 'SelectDate'
                        : formatter.format(
                            _selectedDate!),
                            ), //tarvitsee ! merkin perään
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                        )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            //laitetaan rivien väleihin tyhjää etteivät ole ihan kiinni toisissaan
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      //tarkistetaan onko arvo null, jos true niin lopettaa suorituksen
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(), //tämä tuo tilaa mm buttonien väleihin, huom tällä ei refactoroida vaan lisätään se väliin ko tavalla
              Padding(
                padding: const EdgeInsets.all(
                    8.0), //buttoneiden väliin laitetaan hieman väliä refactoroidaan tuo elevated button paddingilla
                child: ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Save Expense')),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: Colors.red),
                  child: const Text('cancel')),
            ],
          )
        ],
      ),
    );
  }
}
