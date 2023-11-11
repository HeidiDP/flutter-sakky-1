import 'dart:io'; //ios platform paketti
import 'package:flutter/cupertino.dart';  //iOS paketti
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
  //DIALOG FUNKTIOT ALLA IOSILLE JA ANDROIDILLE
  //PLATFORM ON SE MIKÄ KÄYTTÖJÄRJESTLMÄ VALITTUNA
  // showDialog funktio näyttää joko iphonen tai androidin dialogin sen perusteella mikä on käyttöjärjestelmä
 void _showDialog(){
  if(Platform.isIOS){

  //cupertino on iphonelle
  showCupertinoDialog(
        context: context, 
        builder: (ctx) => CupertinoAlertDialog(
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
  }else {
//alertDialog on android järjestelmälle
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
              ),
            );
  } //else
 } //funktio

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


      _showDialog();
          //iphone tyylittelyt tulee laittaa erikseen
      
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
    _titleController.dispose();
    _priceController
        .dispose(); //tämä on nyt texteditingcontrollerille tarkoitettu(muutkin controllerit tarvii tämän)
    super
        .dispose(); //jos ei poisteta "dispoussata" niin voi aihetttuu muistivuotoa ja ohjelma kaatuu
  }

  @override
  Widget build(BuildContext context) {
    //ALLA ON KÄYTETTY MEDIAQUERYÄ
//käytä mediaqueryä kun määritellään kokoja vaikka näppäimistölle ja välejä sinne että asettuisi paremmin näytölle
//viewInsets käytetään tyypillisesti näppäimistön kanssa
//että arvoa MediaQuery.of(context).viewInsets.bottom; voidaan käyttää, tulee se ottaa muuttujaan talteen(keyboardSpace muuttuja tässä)
final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

//UI asettelu widgetillä olevan tilan perusteella, näin tehtynä widgetiä voi käyttää eri paikoissa sovellusta ja se asettuu niihin sopivaksi
return LayoutBuilder(builder: (ctx, constraints) {
 // print(constraints.minWidth);  
  //print(constraints.minHeight);
  //print(constraints.maxHeight);

 final width = constraints.maxWidth;

//LISTAN SISÄINEN IF RAKENNE ALKAA ALLA  3 ERI RIVILLE TEHTY IF-ELSE LISTAN SISÄLLE
  return SizedBox( 
      height: double.infinity, //sizedboxilla paketoitiin vielä rullattava widget että asettuu paremmin näytölle korkeus ääretön
      child: SingleChildScrollView(  //rullattava näkymä widget, tällä paketoitiin tuo padding
        child: Padding(
          padding: EdgeInsets.fromLTRB(16,16,16,16 + keyboardSpace), //joka suuntaan paddingia ja dynaaminen muuttuja 
          child: Column(
            children: [ //lista alkaa
              if(width >= 600)  //listan if syntaksti on ei aaltosulkuja
                Row(// rivi yksi: jos leveä näyttö yli 600 niin title ja price tulevat rinnakkain samalle riville
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Expanded(
                    child: TextField(
                                //teksti kenttä johon voi syöttää tekstinä uuden kulun
                               controller: _titleController,
                               maxLength: 50,
                                // keyboardType: TextInputType.text,
                               decoration: const InputDecoration(
                    label: Text('title'),
                               ),
                             ),
                  ),
                  const SizedBox(
                      width: 24,
                  ),
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
                ],
                )   
                else  //rivi yksi: jos tilaa on vähemmän kuin leveys 600 niin title ja price widgetit tuleva allekkain
                TextField(
                //teksti kenttä johon voi syöttää tekstinä uuden kulun
                controller: _titleController,
                maxLength: 50,
                // keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('title'),
                ),
              ),
              if(width >=600)  //toinen rivi: jos tilaa on enemmän kuin 600 eli kännykkä kyljellään esim näkyy rinnakkain category ja kello
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
                )
              else // toinen rivi: pysyy ennallaan hinta ja kello pysyvät rinnakkain samalla rivillä jos näyttö kapea esim pystyssä kännykkä
              Row(
                children: [ //lista alkaa tästä
                
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
              //kolmas rivi
              if(width >=600)
              Row(   // kolmas rivi:  jos leveä näyttö niin nappulat tulevat omalle riville(kolmannelle riville)
                children: [
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
              else  // kolmas rivi: jos pysty näyttö niin pysyy ennallaan eli
              // categoriat ja napit on rinnakkain
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
        ),
      ),
    );
  
});

    
  }
}
//if (width >=600) 
//else
//tee ensin tuo noin riveille siihen kohtaan kun se on tulossa
// tee noiden väliin uusi rivi Row() ja tuon sisään sitten children[]
// RoW(children [])  <--eli näin. Tuohon väliin sitten kopioitiin haluttuja osia koodista