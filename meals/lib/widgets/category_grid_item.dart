//kuvakkeet näytöllä (italian, asian yms) on category grid itemseja

import 'package:meals/models/category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({required this.category, required this.onSelectCategory, super.key});  //pitää ottaa vastaa myös construktorissa

  final Category category;
  final void Function () onSelectCategory;//otetaan vastaan funktion parametri että voidaan käyttää _selectCatagory funktiota täällä(tehty categories sivulle)

  @override
  Widget build(BuildContext context){
    return 
    //inkwell tai gesturedetector widgetillä paketoitu container. tehdään klikattava kohta tällä(tässä kategoriat on klikattavia)
    //inkwell sisältää erilaisia visuaalisia efektejä
    InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).secondaryHeaderColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding:const  EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
            category.color.withOpacity(0.5),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}