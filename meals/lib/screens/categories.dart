import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
//tässä tehdään luokka mutta ei perinteisesti josssa luokka on saman niminen kuin file 
//tullaan tekemään erilaisia screen widgettejä ja normi widgettejä, siksi nimetään eritavalla


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});  //KETJUTUS WIDGETTIEN VÄLILLÄ ETTÄ SUOSIKKI NAPPI TOIMISI
  final void Function(Meal meal) onToggleFavorite;

//final activeScreen = 'start-screen';  ->tämä on movivalinnan vanha tapa vaihtaa näkymää


  //lisätään uusi metodi/funktio että voidaan siirtyä meals näkymään, käytetään tässä navigatoria
  void _selectCategory(BuildContext context, Category category){ //Category pitää olla tässä jotta klikkauksella osataan näyttää juuri valitun kategorian ruuat
  //haetaan kaiiki valitun kategorian ateriat
  //käytetään where metodia/funktiota, suodatetaan listasta vain halutut, annetaan logiikka jonkaperusteella elementti valitaan tai hylätään
  //oikealle puolelle nuolifunktion jälkeen true/false vertailu
  //contains tutkii listan sisällön ja palauttaa true tai false, löytyykö haluttu parametri vai ei. tässä id perusteella.
  //otetaan talteen filteredMeals muutujaan kooko toimitus
  //pitää muuttaa vielä listaksi jonka vuoksi perässä on toList()
  final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
  
   // Navigator.push(context, route);
    Navigator.of(context).push(
      MaterialPageRoute(
      builder:(ctx) => MealsScreen(
        title: category.title, 
        meals: filteredMeals, 
        onToggleFavorite: onToggleFavorite,), //TÄHÄN TARVITAAN KETJUTUKSETA VIELÄ PARAMETRI ontoggle...
       ),
     );
  }
  //flutterissa näkymät(screens) hallitaan stack:ssa, joka on pino näkymä objekteja(widgettejä)
  //pinon/stack korkein objekti näytetään käyttäjälle. 
  //esim tässä on pino:
  //                    product-page      (3)  ->aktiivinen näkymä
   //                   products-page     (2)
//                      front-page        (1)
//vanhin on pohjalla uusin on päällä, puhs lisää näitä päällekkäin, päällimmäistä käsitellään aina ensin (LIFO) lastin first out 
//aina lisätään päälle ja poistetaa päältä
//push on lisäys, pop on poisto


  @override
  Widget build(BuildContext context) {
    //scaffold on erilainen eri näkymissä tässä apissa, joten näitä tulee useampi eri fileihin
    return GridView(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        childAspectRatio: 3/2, //kuvasuhde
        crossAxisSpacing: 20,  //tyhjää tilaa laatikoiden välille
        mainAxisSpacing: 20,  //rivien välissä tyhjää tilaa
        ),
        children:[ 
        //generoidaan lista griditem objekteja tähän
        for(final category in availableCategories)
        CategoryGridItem(
          category: category, 
          onSelectCategory:(){
            _selectCategory(context, category); //tähän tulee syöttää funktio  joka tehty yllä, tämä on näkyvissä categories sivulla jossa se otetaan vastaan
          } ,)
        ],
    );
  }
}