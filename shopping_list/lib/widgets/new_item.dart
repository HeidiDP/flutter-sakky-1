//tässä tiedostossa on form  jolla käyttäjä voi lisätä uusia tuotteita ostoslistaan

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  //form tarvitsee globalkeyn
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';

//lisätään metodin jonka tarkoitus on tallentaa käyttäjän lisäämä itemi(ELEVATED BUTTTONISSA KÄYTÖSSÄ)
  void _saveItem(){
    if(
    _formKey.currentState!.validate()){ //suoritetaan kaikki validoinnit, ei tapahdu muuten automaattisesti
    _formKey.currentState!.save(); //suoritetaan save inputeissa
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,//avaimen perusteella suoritetaan operaatioita
        child: Column(
          children: [
            TextFormField( //tämä on TEKSTIKENTTÄ (älä käytä textfieldiä)
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Name'),               
              ),
              validator: (value){
                //if tarkistaa onko käyttäjän syötää data hyväksyttävää
            if (value == null ||  // ei saa olla null
                value.isEmpty ||  //ei saa olla tyhjä
                value.trim().length <= 1 || // pitää olla yli 1 merkki
                value.trim().length > 50)// pitää olla alla 50 merkkiä
                {
                  return 'Must be between 2 and 50 characters'; //on virhe jos jokin ylläolevista toteutuu
                }
                return null; //ei ole virhettä
              },
              onSaved: (newValue) {
                _enteredName = newValue!;
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField( //TÄMÄ ON TEKSTIKENTTÄ
                    keyboardType: TextInputType.number ,
                    decoration: const InputDecoration(
                      label: Text('Quantity'),                   
                    ),
                    //initailvalue on määritelty arvo kentässä
                    initialValue: '1', //string muodossa aina formit vaikka on luku kyseessä
                    //validoidaan että saadaan oikeanlainen arvo kenttään ja että sitä voi käyttää kentässä
                     validator: (value){
                //if tarkistaa onko käyttäjän syötää data hyväksyttävää
            if (value == null ||  // ei saa olla null
                value.isEmpty ||  //ei saa olla tyhjä
                int.tryParse(value) == null || //pitää olla numero jos null tulee niin silloin ei ole ollut numero 
                int.tryParse(value)! <= 0)// jos on 0 tai neg luku niin ei käy
                {
                  return 'Must be a valid positive number'; //on virhe jos jokin ylläolevista toteutuu
                }
                return null; //ei ole virhettä
              },
                  ),
                ),
                const SizedBox(
                  width: 8,
                  ),
                  //dropdownissa on tarkoitus näyttää kaikki tuotteet allekkain mitä categorieslistassa on(nämä löytyy categories filestä)
                Expanded(
                  //ALASVETOVALIKKO JOSSA KATEGORIAT
                  child: DropdownButtonFormField(
                    
                    items: [
                    //for silmukka listan sisällä
                    for(final category in categories.entries) //palauttaa mapin iterable pakettina jotta se voidaan loopata läpi
                      DropdownMenuItem(
                        value: category.value,
                        child: Row(
                          children: [
                          Container(
                            width: 16,
                            height: 16,
                            color: category.value.color,
                          ),
                          const SizedBox(
                            width: 6,                           
                          ),
                          Text(category.value.title),
                        ],
                      ),
                    ),
                              ], onChanged: (data){}),
                )
            ],
           ),
           const SizedBox( 
            width: 12,
           ),
           //NAPIT RIVILLE (reset ja save)
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: (){_formKey.currentState!.reset(); 
                },
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: _saveItem, 
                child: const Text('Save item'),
              )
            ],) 
         ],
      ),
      ),
    ),
  );
  }
}