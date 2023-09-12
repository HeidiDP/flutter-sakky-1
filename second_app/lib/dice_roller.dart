import 'package:flutter/material.dart';
import 'dart:math'; //tällä saadaan satunnaisluku tulemaan nopasta

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});


  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// _ alaviiva ennen luokan nimeä tekee luokasta privaten eli luokkaa voi käyttää vain tämän tiedoston sisällä
class _DiceRollerState extends State<DiceRoller> {



 var currentDiceRoll = 2;

  //funktio
  
void rollDice() {

//koodi
//määritetään anonyymi funktio
setState(() {
//täällä muokatut luokkamuuttuja aiheuttavat käyttöliittymän päivityksen tai tämän luokan päivitykset joka tarkoittaa build funktin
//suorittamista uudelleen
currentDiceRoll = Random().nextInt(6)+1;// tässä haetaan kuvista randomisti 1-6 välillä oleva luku/kuva
}); 

}


@override
  Widget build(BuildContext context){
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'asset/images/d$currentDiceRoll.png',
              width: 200,
            ),
             const SizedBox(height: 20, 
            ),
            
            TextButton(
              //onPressed: () {
              //tähän tulee funktio
              //}
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only( //padding tekee tyhjää tilaa widgetin ympärille
                  top: 20
                  ),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 28,
                ),
              ),
              child: const Text('Roll Dice'),
            ),
          ],
        );
  }
}

