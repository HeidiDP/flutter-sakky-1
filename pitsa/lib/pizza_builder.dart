import 'package:flutter/material.dart';
import 'package:pitsa/Models/ingredient.dart';
import 'package:pitsa/select_ingredients.dart';


//tämä on stateful widget (state widget) jotta kun käyttäjä valitsee
//pitsa täytteitä niin tämä päivittyy
//tällä statefull widgetillä voi olla lapsina stateless widgettejä

//tässä tehtiin ensin materialapp, scaffold, container ja selectingredients
//widgetit
//sen jälkeen tehtiin uusi file select_ingredients.dart, muista lisätä import paketit

class PizzaBuilder extends StatefulWidget {
  const PizzaBuilder({super.key});

  @override
  State<PizzaBuilder> createState() => _PizzaBuilderState();
}

class _PizzaBuilderState extends State<PizzaBuilder> {
 final List<Map<Ingredient, int>> selectedIngredients = [];


void incrementIngredient(Ingredient ingredient){
  setState(() {
    
  //alla luodaan muuttuja ingredientMap jossa on Map joka sisältää täytteet ja määrä
 final Map<Ingredient, int> ingredientMap = selectedIngredients.firstWhere((element) => 
 element.containsKey(ingredient), orElse: () {
   final newMap = {ingredient: 1};
   selectedIngredients.add(newMap);
   return newMap;
 });
 ingredientMap[ingredient] = (ingredientMap[ingredient] ?? 0) + 1;  
 //null crash esto eli jos täytettä ei ole niin palauttaa 0 eikä sovellus kaadu
});
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Container(
          child: SelectIngredients(selectedIngredients, 
          onAddIngredient: incrementIngredient),
       ),
      ),
    );
  }
}