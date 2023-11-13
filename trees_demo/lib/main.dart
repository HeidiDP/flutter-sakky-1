import 'package:flutter/material.dart';
import 'package:trees_demo/keys.dart';

import 'package:trees_demo/ui_updates_demo.dart';

void main() {
  //mutable/immutable (mutable on muokattavissa/immutable ei muokattavissa)

  final numbers = [1,2,3]; //numbers muuttuja on final, ei voi muokata mutta itse lista
  //on erilllinen asia muistissa, jota voi edellee muokata

  //var numbers = [1,2,3]; jos on var etuliitteellä varustettu niin sitä voidaan muokata

  //const numbers = [1,2,3]; //sekö osoite(numbers) että ja listan sisältö on lukittu

  numbers.add(4);

  var nums = [1,2];  //-> 0x323jfelka(osoite) List(1,2)
  nums = [3,4]; //-> //j-> 9ueiahe0a9(osoite) List(3,4)
  
numbers.add(5);
  // 0x323jfelk osoitteseen ei enää viitata ja roskien keruu vapauttaa muistin

//kuinka laitteet käyttävät ram muistia
//jokaisella sovelluksella on oma stack ja heap
//ytimellä/säikeellä on oma stack mutta jaettu heap
  //stack on pino-> järjestyksessä päällekkäin  (nopeampi kuin heap)
  //heap on keko/läjä -> asiat satunnaisesti jotenkin kasassa satunnaisen kokoisia

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        body: const Keys(),
      ),
    );
  }
}
//flutterissa kolme puuta
//1. widget tree- meidän koodi koostaa käyttöliittymän
//2. element tree- flutter automaattisesti taustalla rakentaa muistiin elelmnti jokaista widget objektia. elementissä on viittau
// käytettävissä olevaan widget objektiin. flutter käyttää tätä määrittelemään onko tarvetta päivittää UI
//3. render tree- näkyvät käyttöliittymän osat. flutter välttää käyttöliittymän uudelleen genereointia mahdollisimman paljon
//widget<->element vertailiu käytnnistäää käyttöliittymän päivityksen

// 1.                       build()        
// 2.             new expect UI <-> actual UI
//3.              UI gets updated as needed

//                  luodaan kerran build
//                  käytetään uudelleen
//widget tree        element tree
//column ()        <- column element
// (key C)item widgetC   <- itemwidge element  -> State C
// (key B)itemwidgetB     <- itemwidget element   -> State B
//(key A)itemwidgetA        <- itemwidget element    -> State A

//nuo ceet ja aat ja beet on väärin, (en ymmärrä tämän pointtiä)