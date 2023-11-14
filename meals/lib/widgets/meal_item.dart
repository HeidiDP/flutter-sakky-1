import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

//tämä rakentaa ateriakohtaisen widgetin

class MealItem extends StatelessWidget {
  const MealItem ({super.key, required this.meal});

final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){},
        child: Stack(
          //widgetit jotka ovat päällekkäin(huom, ylin on alin)
          children: [
            //kuva latautuu, ilmestyy hitaasti
            FadeInImage(placeholder: placeholder, image: image)
          ],
        ),
      ),
    );
  }
}