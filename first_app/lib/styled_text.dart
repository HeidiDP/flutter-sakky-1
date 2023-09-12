import 'package:flutter/material.dart';

//tehtiin tekstille oma luokka ja siirretään se omaan tiedostoon
class StyledText extends StatelessWidget{


 const StyledText({super.key});

 @override
 Widget build(BuildContext context){
  return const Text(
              'Onko siellä ketään kotona?',
    style: TextStyle(
      color: Colors.white,
       fontSize: 26,
     ),
  ); 
  
 }
}