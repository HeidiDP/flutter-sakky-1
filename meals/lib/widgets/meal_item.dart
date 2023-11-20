import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

//tämä rakentaa ateriakohtaisen widgetin

class MealItem extends StatelessWidget {
  const MealItem ({super.key, required this.meal, required this.onSelectMeal});

final Meal meal;
final void Function() onSelectMeal;

String get complexityText{// 0 indeksi on aina iso kirjain ja loput sitten 1 indexizstä alkaen pieniä 
  return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
}
String get affordabilityText{// 0 indeksi on aina iso kirjain ja loput sitten 1 indexizstä alkaen pieniä 
  return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
      child: InkWell(
        //koodin jäsennys malli MVC(PHP, AsP.NET) = model, hallitaan tietokantaa (SQL)
        // view = genereoidaan käyttöliittymä, controller=erilaisen datan hallintaan esim käytetään model luokkaa
        onTap: onSelectMeal,
        child: Stack(
          //widgetit jotka ovat päällekkäin(huom, ylin on alin)
          children: [
            //kuva latautuu, ilmestyy hitaasti
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              ),
              Positioned(
                //määritellään mistä boksi alkaa, tämä tulee kuvan päälle, kuva kuultaa alta läpi
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child:  Column(
                    children: [
                      Text(
                        //eka rivi
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [BoxShadow(color: Colors.black,
                          offset: Offset(2.0, 2.0,),
                          blurRadius: 3.0,)]
                        ),
                        ),
                     const SizedBox(
                        height: 12,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //toka rivi
                        children: [
                          //ensimmäinen ikoni
                          MealItemTrait(
                            icon: Icons.schedule, 
                            label:'${meal.duration} min',
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            //toinen ikoni
                            MealItemTrait(
                            icon: Icons.work, 
                            label: complexityText,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            //kolmas ikoni
                            MealItemTrait(
                            icon: Icons.attach_money, 
                            label: affordabilityText,
                            ),

                        ],
                      )],
                  ),
                ),
                )
          ],
        ),
      ),
    );
  }
}