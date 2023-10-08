import 'package:flutter/material.dart';


class SelectCategory extends StatelessWidget {
  
  final String category;  

  const SelectCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Valittu kategoria: ($category)',
        style:const TextStyle(fontWeight: FontWeight.bold)),//tässä kokeiltu ottaa const pois ja lisätä tuo $category muuttuja tekstiin
        backgroundColor: const Color.fromARGB(255, 100, 50, 100),
      ),
      body: Container( decoration: const BoxDecoration(  //musta taustaväri
            color: Colors.black),
        child: Center(
          child: Text(category, style: const TextStyle( color: Colors.white),),
           //tämä alunperin ja ylempi $category on nyt uusi "kokeilu"
        ),
      ),
    );
  }
}