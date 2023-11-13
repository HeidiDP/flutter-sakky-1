//kuvakkeet näytöllä (italian, asian yms) on category grid itemseja

import 'package:meals/models/category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
          category.color.withOpacity(0.5),
          category.color.withOpacity(0.9),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
      ),
    );
  }
}