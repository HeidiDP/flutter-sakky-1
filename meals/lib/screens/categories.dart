import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
//tässä tehdään luokka mutta ei perinteisesti josssa luokka on saman niminen kuin file 
//tullaan tekemään erilaisia screen widgettejä ja normi widgettejä, siksi nimetään eritavalla


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //scaffold on erilainen eri näkymissä tässä apissa, joten näitä tulee useampi eri fileihin
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      //bodyosio on erivärisiä laatikoita näytöllä jossa lukee ericatekorioiden (nimiä gridview)
      body: GridView(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        childAspectRatio: 3/2, //kuvasuhde
        crossAxisSpacing: 20,  //tyhjää tilaa laatikoiden välille
        mainAxisSpacing: 20,  //rivien välissä tyhjää tilaa
        ),
        children:[ 
        //generoidaan lista griditem objekteja tähän
        for(final category in availableCategories)
        CategoryGridItem(category: category)
        ],
      ),
    );
  }
}