import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = availbleMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
        ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 3/2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    ),
    children: [
      for(final category in availableCategories)
      CategoryGridItem(
        category: category,
        onSelectCategory: (){
          _selectCategory(context, category);
        }
      )
    ],
    );
  }
}