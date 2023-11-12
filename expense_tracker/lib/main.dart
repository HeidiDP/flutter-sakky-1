import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorSceme = ColorScheme.fromSeed(
  seedColor:const  Color.fromARGB(255, 88, 40, 171),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor:const  Color.fromARGB(255, 2, 84, 117),

);

void main() {
 /* WidgetsFlutterBinding.ensureInitialized();
  //alla on responsiivisuuteen liittyvä luokka jossa funktio setPreferred....
SystemChrome.setPreferredOrientations([
  //tehdään lista objekteja alle (jätetään kommentteihin osa näistä)
 // DeviceOrientation.portraitDown,
  DeviceOrientation.portraitUp,
 // DeviceOrientation.landscapeLeft,
]).then((fn) => */

runApp(  //nuolifunktio
//THEMES-> TÄÄLLÄ ON TEEMOJA MM VÄRITYS TUMMA/VAALEA JA ERILAISET TEKSTITYYLIT, INPUTTIEN VÄRI, IKONIEN/NAPPIEN VÄRIT JA TYYLIT
 MaterialApp(
    darkTheme: ThemeData().copyWith(useMaterial3: true,
    colorScheme: kDarkColorScheme,
    cardTheme: const CardTheme().copyWith(
      color: kDarkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer),
    ),
    scaffoldBackgroundColor: kDarkColorScheme.primaryContainer.withOpacity(0.3),
     textTheme:  ThemeData().textTheme.copyWith( // tai voit käyttää myös -> TextTheme().copyWith() 
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kDarkColorScheme.onSecondaryContainer,
        fontSize: 24,
        ),
        bodyMedium: TextStyle(
          color: kDarkColorScheme.onSecondaryContainer
        ),
        bodyLarge: TextStyle(color: kDarkColorScheme.onSecondaryContainer),
        titleMedium: TextStyle(color: kDarkColorScheme.onSecondaryContainer),
      ),
      iconTheme: const IconThemeData().copyWith(color: kDarkColorScheme.onPrimaryContainer),
      canvasColor: kDarkColorScheme.secondaryContainer,
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        fillColor: Colors.white,  //inputin ympärillä
        prefixStyle: TextStyle(color: kDarkColorScheme.onSecondaryContainer),
        suffixStyle: TextStyle(color: kDarkColorScheme.onSecondaryContainer),
      ),
    ),
    theme:ThemeData().copyWith(useMaterial3: true,
    colorScheme: kColorSceme,
    appBarTheme: const AppBarTheme().copyWith(
      //copyWith säilyttää oletus arvot ja korvataan vain täällä määritetyt asia
      //widgeteillä omat oletusarvotyylit, vain täällä erikseen määritetyt arvot korvataan
      backgroundColor: kColorSceme.onPrimaryContainer,
      foregroundColor: kColorSceme.primaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: kColorSceme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorSceme.primaryContainer,

      ),
    ),
    textTheme:  ThemeData().textTheme.copyWith( // tai voit käyttää myös -> TextTheme().copyWith() 
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kColorSceme.onSecondaryContainer,
        fontSize: 24,
        ),
        
    ), 
   ),
    themeMode: ThemeMode.system, //default oletusasetus on system, jos käyttäjä haluaa asettaa dark teeman tähän appiin
    home:const  Expenses(),
    ),
  );
//);
}

// kertaus:
// snackbar: Expenses.dart tiedostossa käytössä-> snackbar on tapa ilmoittaa käyttjälle viestejä
  //tässsä annetaan ilmoitus ostoksen poistosta ja nappi jolla ostos voidaan palauttaa
  // Safearea expenses sivulla, ohjelma ei käytä esim puhelimen näytön yläreunaa jossa kamera
// modal: expenses sivu: kun painetaan lisää kulu plussaa niin aukeaa erilinen puolikas sivu jossa on
//käyttäjän syötteet. tuo sivu on modal
//käyttäjän syöte 3 eri vaihtoehtoa
//1. new_expense tiedostossa on käyttjän syötteitä johon kulun nimi, hinta syötetään, myös pvm valitaan ja pudotusvalikosta kulun tyyppi
// 2. 
//käytäjän syötteen hallinta: submitexpensedata funktio nappia painettaessa tarkistaa mitä käyttäjä on syöttänyt kenttiin
// dialog: new_expense tiedosto, nämä on käyttöjärjestelmän valintaan liittyvät funtiot esim androidille oma ja ios oma dialog, /
          //appi toimii sitten molemmissa kun nämä on huomioitu
//Platform main tiedostoss on käyttöjärjeselmä widget
// context
//maincontent: expenses filesta löytyy ko niminen widget, tässä näkyy tallennetut kulut
// listan sisäinen if: new expense tiedosto
//Mediaquery: new expense tiedostossa
// appbar, iconbutton: tämä on nappi millä avataan näytön yläreunasta kulun lisäys kohta
//listview: expense_list tiedostossa käytössä, expenses eli listataan kulut allekkain
//Listview.builder: expenses_list tiedostossa, tähän liittyy childin ja aikuisen koot ja niiden käyttö, 
//dismissible:expeses_list tiedostossa: pyyhäisy tyyli poistoon 
//themes: mainissa vaalea ja tumma väri teema koko ohjelmassa
