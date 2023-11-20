import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar:AppBar(
      title: Text(meal.title), //haetaan meal objektista title
    ),
    body:Column(children: [Image.network(meal.imageUrl,
    width: double.infinity,
    fit: BoxFit.cover,
         ),
         const SizedBox(
          height: 14,
         ),
         Text(
          'Ingredients', 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
         ),
         ),
         const SizedBox(
          height: 24,
          ),
         //...meal.ingredients.map((e) => Text(e)).toList(), //näin voit tehdä listan inggredientseistä mappaamalla tai alla for luuppi
         for(final ingredient in meal.ingredients) 
         Text(
          ingredient,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          ),
           const SizedBox(
          height: 14,
         ),
         Text(
          'Steps', 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
         ),
         ),
         const SizedBox(
          height: 24,
          ),
         //...meal.ingredients.map((e) => Text(e)).toList(), //näin voit tehdä listan inggredientseistä mappaamalla tai alla for luuppi
         for(final step in meal.steps) 
         Text(
          step,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          ),

       ],
      ),
    );
  }
}