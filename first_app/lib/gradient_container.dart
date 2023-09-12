import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';
//tässä tehdään oma kustomoitu luokka taustalle jossa taustaväri ja tekstin koko/väri
class GradientContainer extends StatelessWidget{

//constructor
const GradientContainer({super.key})//{  //super key on parametri jonka flutter tarvitsee
  //voi olla myös erillinen koodi body
  //initialization code
//}    constructorilla ei voi olla body osaa eli {}

//funktio/metodi
  @override  //tämä viittaa että tuo alla oleva funktio tulee extends statelesswidget
  Widget build(context){
    //abstrackt luokka ei voi luoda objektia, siitä vaoin peritään
    return Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
            colors:[Color.fromARGB(255, 238, 121, 12), Color.fromARGB(255, 240, 43, 151)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            ),  
          ), // löydät valikoitavat ctr+välilyönti (älä paina decoration päällä vaan jälkeen)
          child: const Center(     // center objekti keskittää tekstin
            child: StyledText()
             //Teksti widget 
          ),
        );
  }
}