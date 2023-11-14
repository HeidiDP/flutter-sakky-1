import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsScreen extends StatelessWidget {   //1. tee luokka
  const MealsScreen({super.key, required this.title, required this.meals});             //2 tee constructori

final String title;         // tulee gategory griditem objetista
final List<Meal> meals;     //tulee gategory griiditem objektista, tarvitaan lista meal objekteja

  @override                                   //3. build tarvitsee overiden
  Widget build(BuildContext context){         //4. build widget 

    Widget content = ListView.builder(
      itemCount: meals.length,  //määrällisesti kaikki mitä löytyy ->itemcount, kerrotaan montako asiaa listaan on tulossa
      //(ctx, index) indeksi on laskuri joka lähtee 0,1,2,3,....
      itemBuilder: (ctx, index) => Text(meals[index].title),   //()=> on nuolifunktio joka palauttaa widgetin (Text), tarvitsee 
      //meals listasta haetaan indexin perusteella kaikki otsikot, ruokien nimet
      );       
 
 //tarkistetaan onko lista tyhjä
 if(meals.isEmpty){
  //luodaan jokin toinen context scaffoldin body osiolle jos lista on tyhjä, tulee teksti joka alla
  content = Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('nothing here...',
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
         ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text('try selecting a different category!',
         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
         ),),
      ],
    ),
  );
 }
 
  return Scaffold(                            //5. palautetaan jotain 
    appBar: AppBar(
      title: Text(title),
    ),
    //alla on listan generointi listview.builder avulla. 
    body: content,
  );
  }
}