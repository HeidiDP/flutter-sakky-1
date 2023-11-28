import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/screens/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//eka tehdään tämä main sivu
//sitten rakennetaan categorias näkymä, tehdään lib uusi tiedosto categories.dart

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const  Color.fromARGB(255, 131, 57, 0), //eka on 255 alunperin
    ),
    textTheme: GoogleFonts.latoTextTheme(),
);

void main(List<String> args){
  //paketoidaan koko app riverpod widgetillä jotta sen ominaisuudet ovat saatavilla, 
  //ei ole aina pakko paketoida koko appia, voi olla vain tiettyjä osia paketoituna
  runApp(const ProviderScope(
    child: App()));
}

class App extends StatelessWidget{
  const App ({super.key});

@override
Widget build(BuildContext context){
  return MaterialApp(
     theme: theme,
     home:const TabsScreen(),
    );
  }
}

//riverpod
// 1. luodaan providers tiedostoja joissa on data ja keino muokata dataa
//2. widgetit ovat "consumers" jotka käyttävät providerin dataa ja metodeja
