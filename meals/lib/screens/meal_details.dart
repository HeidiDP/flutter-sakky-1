import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal, 
  //required this.onToggleFavorite, KOMMENTOITU
  }); //NÄMÄ ON PARAMETREJA-> this.meal(mitä halutaan ottaa vastaan)

final Meal meal;
//final void Function(Meal meal) onToggleFavorite; //TÄMÄ FUNKTIO LISÄTTY MYÖS TÄNNE(KETJUTUS) KOMMENTOITU POIS

  @override
  //consumer widget tarvitsee buildiin erikseen ref parametrin
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold (
      appBar:AppBar(
      title: Text(meal.title),//haetaan meal objektista title
      actions: [
        IconButton( //TÄHÄN TULEE KETJUTUS FUNKTIOISTA ERI WIDGETTIEN KAUTTA YLLÄ FUNKTIO
         //onpressed on PARAMETRI. sen oikealla puolella on meidän syöttämä argumentti
          onPressed: (){
            //read koska olemme funktion sisällä, watch aiheuttaisi ongelmia
            
           final wasAdded = ref
            .read(favoriteMealsProvider.notifier)
            .toggleMealFavoriteStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();//poistetaan vanha viesti
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(wasAdded ? 'Meal was added as favorite.' : 'Meal removed.'
              ),
            ),
);
            //onToggleFavorite(m;eal); //TÄMÄ ON ARGUMENTTI(mitä yritetään antaa)KOMMENTOITU POIS
          }, 
          icon: const Icon(Icons.star)
          ),
      ]),
    body:SingleChildScrollView(
      child: Column(children: [Image.network(meal.imageUrl,
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

           Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12, 
              vertical: 8,
              ),
             
           child: Text(
            step,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
             ),
    
         ],
        ),
    ),
    );
  }
}