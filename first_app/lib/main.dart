/*
1. dart projekti alkaa lib/main.dart tiedostosta
2. Suortitus alkaa main funktiosta.Lisää tähän tiedostoon main funktio
3. flutter käynnisty runApp funktiosta. Lisää se.
4. flutter käyttää  material design UI-kirjastoa, lisää se widget.
5. käyttöliitymän rakennus alkaa jostakin widgetistä, lisää se
6. Lisää tekstiä joka on keskitetty
AVAA EMULAATTORI, VIEW-LAUNCH FLUTTER EMULATOR, JOS AVAA VAIN SIVUN EIKÄ PUHELINTA NIIN OIK ALAKULMA NAPAUTA KOHTAa
jossa lukee windows ja valitse emulaattori tilalle
*/

import 'package:flutter/material.dart'; //tämä tarvitaan että runApp saadaan toimimaan, tuo flutter kirjastosta import komennolla
import 'package:first_app/gradient_container.dart'; //tämä tarvitaan viittaamaan omaan tiedostoon josta tuo gradientcontainer luokka löytyy
void main() {
  runApp(const MaterialApp(    //const parantaa suorituskykyä. const tarkoittaa myös että tämä 
      home: Scaffold(     //rakennetta sisältävä widget, parantaa visuaalisuutta  
        body: GradientContainer(), //kutsutaan tässä alle tehtyä kustomoitua luokkaa(värit fontit ja teksti)
      ),
    ),
  );
}

/* flutter on "type-safe" kieli,tarkoittaa data tyyppiä
data->              datatyypin nimi
'hello world' ->    srtrig /object
29 ->               int /num /objet
materialApp ->      materialApp/widget/object
OmaLuokkaWidget ->  Omaluokkawidget/widget/object  

luokilla voi tehdä omia datarakenteita tai datatyyppejä

Luokka on kokoelma 1. dataa ja 2. toiminnallisuutta
1. data on muuttujia/variables/properties(propertie on muuttuja joka on luokan sisällä)
2. toiminnallisuus on funktio /function/ method(kun funktio on luokan sisällä käytetään termiä metodi)
3. rakentaja funktio /constructor, voidaan määrittää koodia, joka
suoritetaan kun luokasta luodaan oliota /objektia
*/



