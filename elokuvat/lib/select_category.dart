import 'package:flutter/material.dart';


class SelectCategory extends StatelessWidget {
  
  final String category;  

  const SelectCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Valittu kategoria: ($category)'),//tässä kokeiltu ottaa const pois ja lisätä tuo $category muuttuja tekstiin
      ),
      body: Center(
        child: Text(category), //tämä alunperin ja ylempi $category on nyt uusei "kokeilu"
      ),
    );
  }
}