import 'package:favorite_places/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final colorSchema = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 99, 9, 245),
  background: const Color.fromARGB(244, 49, 59, 45),
  );
  final theme = ThemeData().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: colorSchema.background,
    colorScheme: colorSchema,
    textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
      titleSmall: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
      ),
    ),
  );

void main(){
  runApp( const ProviderScope(
    child: MyApp()
  ));
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'My Places',
      theme: theme,
      home: const PlacesScreen(),
    );
  }
}

//Model luokalle "places" jossa property title
//riverpod jossa dynaaminen places lista
//sivu joka generoi riverpod datan sisällön
// sivu jossa lisätään objekteja riverpod dataan
//klikataan jotain places objektia, näytetään uusi sivu: places_details