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
// snackbar:  //snackbar on tapa ilmoittaa käyttjälle viestejä
  //tässsä annetaan ilmoitus ostoksen poistosta ja nappi jolla ostos voidaan palauttaa
// modal
//käyttäjän syöte 3 eri vaihtoehtoa
//käytäjän syötteen hallinta
// dialog
// context
// appbar, iconbutton: tämä on nappi millä avataan näytön yläreunasta kulun lisäys kohta
//listview: expenses eli listataan kulut allekkain
//themes: mainissa vaalea ja tumma väri teema koko ohjelmassa
